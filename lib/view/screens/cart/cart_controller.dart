import 'package:customer_app/view/widget/drink_card.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../../constant/status_request.dart';
import '../../../general_controllers/statuse_request_controller.dart';
import '../../../main.dart';
import '../../widget/snak_bar_for_errors.dart';
import 'cart_page.dart';
import 'cart_service.dart.dart';

class CartController extends GetxController
    implements StatuseRequestController {
  @override
  StatuseRequest? statuseRequest = StatuseRequest.init;
  late RxBool passwordSecure = true.obs;
  CartService service = CartService();
  late MakeOrder order;
  String description = '';
  @override
  void onInit() async {
    order = Get.arguments;
    //statuseRequest = await checkIfTheInternetIsConectedBeforGoingToThePage();
    super.onInit();
  }

  void onpressDone() async {
    statuseRequest = StatuseRequest.loading;
    update();
    dynamic response =
        await sendData(); // check if the return data is statuseRequest or real data
    statuseRequest = handlingData(response); //return the statuseResponse
    if (statuseRequest == StatuseRequest.success) {
      whenLoginSuccess(response);
    } else if (statuseRequest == StatuseRequest.authfailuer) {
      snackBarForErrors("Auth error".tr, "Please login again".tr);
      Get.offAllNamed('LoginPage');
    } else {
      // when happen a mestake we handel it here
      [];
    }
    update();
  }

  sendData() async {
    String token = await prefService.readString('token');

    String finalOrder = '';
    for (var i = 0; i < order.drinksWithAmount.length; i++) {
      if(order.drinksWithAmount[i].amount>0){
      if (order.drinksWithAmount.length - 1 == i) {
        finalOrder +=
            "${order.drinksWithAmount[i].drink.id}:${order.drinksWithAmount[i].amount}";
      } else {
        finalOrder +=
            "${order.drinksWithAmount[i].drink.id}:${order.drinksWithAmount[i].amount},";
      }}
    }
    String reservatinId = await prefService.readString('reservationID');

    Map<String, String> data = {
      "reservation_id": reservatinId,
      "description": description,
      "drinks": finalOrder
    };
    Either<StatuseRequest, Map<dynamic, dynamic>> response =
        await service.makeOrder(token, data);

    return response.fold((l) => l, (r) => r);
  }

  handlingData(response) {
    if (response is StatuseRequest) {
      return response;
    } else {
      return StatuseRequest.success;
    }
  }

  whenLoginSuccess(response) async {
    DrinkCardController drinkCardController = Get.find();
    order.drinksWithAmount = [];
    drinkCardController.makeTheNumberofDriknsEqualsZero();
    Get.back();
    snackBarForErrors('Your order send'.tr, 'Please wait until be done'.tr);
    update();
  }
}

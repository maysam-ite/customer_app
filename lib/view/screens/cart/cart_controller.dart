import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../../constant/status_request.dart';
import '../../../general_controllers/statuse_request_controller.dart';
import '../../../main.dart';
import '../../widget/snak_bar_for_errors.dart';
import 'cart_page.dart';
import 'cart_service.dart.dart';

class CartController extends GetxController  implements StatuseRequestController {
  @override
  StatuseRequest? statuseRequest = StatuseRequest.init;
  late RxBool passwordSecure = true.obs;
  CartService service = CartService();
  late MakeOrder order;
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
      snackBarForErrors("Auth error", "Please login again");
      Get.offAllNamed('LoginPage');
    } else {
      // when happen a mestake we handel it here
      [];
    }

    update();
  }

  sendData() async {
    String token = await prefService.readString('token');
    
List<Map<String, dynamic>> drinksMapList = order.drinksWithAmount
      .map((drinkAmount) => {
            "drink_id": drinkAmount.drink.id,
            "quantity": drinkAmount.amount,
          })
      .toList();
      for (var i = 0; i < drinksMapList.length; i++) {
        
      print(drinksMapList[i]);
      }
      print(drinksMapList.length);
    Map<String, dynamic> data = {
      "reservation_id": 2,
      "drinks": drinksMapList
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
     Get.back();
    update();
  }
}

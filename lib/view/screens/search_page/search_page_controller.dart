import 'package:customer_app/data/Models/drink_model.dart';
import 'package:customer_app/view/widget/drink_card.dart';
import 'package:get/get.dart';

class GeneralSearchController extends GetxController {
  DrinkCardController drinkCardController = Get.find();
  List<DrinkModel> drinkSearchedList = [];

  @override
  void onInit() {
    drinkSearchedList = drinkCardController.finalListData;
    super.onInit();
  }

  RxInt drinkSearchedListLength = 0.obs;
  void drinkSearch(String drinkSearhedName) {
    if (drinkSearchedList.isEmpty) {
      drinkSearchedList = drinkCardController.finalListData;
    }

    print('drinkSearchedList: ');
    print(drinkSearchedList.length);

    drinkSearchedList = drinkCardController.finalListData
        .where((character) => character.name
            .toLowerCase()
            .startsWith(drinkSearhedName.toLowerCase()))
        .toList();
  }
}

import 'package:customer_app/data/Models/drink_model.dart';
import 'package:customer_app/view/widget/drink_card.dart';
import 'package:get/get.dart';

class GeneralSearchController extends GetxController {
  DrinkCardController drinkCardController = Get.find();
  List<DrinkModel> drinkSearchedList = [];

  @override
  void onInit() {
  // if (drinkSearchedList.isEmpty) {
      
      drinkSearchedList .addAll( drinkCardController.finalListData);
  drinkSearchedListLength.value = drinkCardController.finalListData.length;

    // }
    print('drinkSearchedList.length: ');
    print(drinkSearchedList.length);
    print(drinkCardController.finalListData.length);
  super.onInit();
  }

  RxInt drinkSearchedListLength = 0.obs;
  void drinkSearch(String drinkSearhedName) {
    
    print('drinkSearchedList: ');
    print(drinkSearchedList.length);

    drinkSearchedList = drinkCardController.finalListData
        .where((character) => character.name
            .toLowerCase()
            .startsWith(drinkSearhedName.toLowerCase()))
        .toList();
  }
}

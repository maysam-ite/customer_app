// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:customer_app/view/screens/cart/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/sizes.dart';
import '../../constant/theme.dart';
import 'general_text_style.dart';

// ignore: must_be_immutable
class DrinkCard extends StatelessWidget {
  Drink drink;
  Function()? onPressed;
  DrinkCard({super.key, required this.drink, this.onPressed});
  @override
  Widget build(BuildContext context) {
    DrinkCardController controller = Get.put(
      DrinkCardController(),
    );
    Sizes size = Sizes(context);
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
                color: Get.isDarkMode ? skinColorWhite! : backGroundDarkColor),
            color: Get.isDarkMode
                ? darkWoodBrownColor.withOpacity(0.9)
                : woodBrownColor.withOpacity(0.9),
            borderRadius: BorderRadius.circular(size.buttonRadius)),
        width: 100, //size.drinkCardWidth,
        height: 210,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 150,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(size.buttonRadius),
                    topRight: Radius.circular(size.buttonRadius),
                  ),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.asset(
                          // drink.imageName;
                          'assets/images/medium page background image.jpg',
                          fit: BoxFit.fill,
                        ),
                      ),
                      Positioned.fill(
                        child: Container(
                          color: backGroundDarkColor.withOpacity(0.2),
                        ),
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 6,
                          ),
                          addRemoveButton('add', controller),
                          const Spacer(),
                          Obx(() => Text(
                                controller.numberOfDrinks[drink.id].value
                                    .toString(),
                                style: TextStyle(
                                  color: skinColorWhite,
                                ),
                              )),
                          const Spacer(),
                          addRemoveButton('remove', controller),
                          const SizedBox(
                            width: 6,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              AutoSizeText(
                drink.name,
                style: generalTextStyle(20),
              ),
              const SizedBox(
                height: 3,
              ),
              AutoSizeText(
                '${drink.unitPriceInSP} S.P',
                style: generalTextStyle(15),
              ),
            ]),
      ),
    );
  }

  Widget addRemoveButton(
      String addOrRemove, DrinkCardController drinkCardController) {
    return SizedBox(
      width: 60,
      child: MaterialButton(
        onPressed: () {
          addOrRemove == 'add'
              ? drinkCardController.increaseTheNumberOfDrinks(drink.id, drink)
              : drinkCardController.decreaseTheNumberOfDrinks(drink.id);
          //add one from this drink or remove one of the drink
        },
        child: Icon(
          addOrRemove == 'add' ? Icons.add : Icons.remove,
          color: skinColorWhite,
        ),
        // ),
      ),
    );
  }
}

class Drink {
  // String imageName;
  int id;
  String name;
  int unitPriceInSP;
  Drink({
    required this.id,
    // required this.imageName,
    required this.name,
    required this.unitPriceInSP,
  });
}

class DrinkCardController extends GetxController {
  List<RxInt> numberOfDrinks = <RxInt>[].obs;
  Order order = Order();
  void increaseTheNumberOfDrinks(int id, Drink drink) {
    numberOfDrinks[id].value++;
    if (ifAddForTheFirstTime(drink)) {
      order.drinksWithAmount.add(DrinkAmount(drink: drink, amount: 1));
    } else {
      for (var element in order.drinksWithAmount) {
        if (element.drink == drink) {
          element.amount++;
        }
      }
    }
  }

  bool ifAddForTheFirstTime(Drink drink) {
    for (var element in order.drinksWithAmount) {
      if (element.drink.name == drink.name) {
        return false;
      }
    }
    return true;
  }

  void decreaseTheNumberOfDrinks(int id) {
    order.drinksWithAmount[id].amount--;
    numberOfDrinks[id] > 0 ? numberOfDrinks[id].value-- : null;
  }

  void makeTheNumberofDriknsEqualsZero() {
    for (var element in numberOfDrinks) {
      element.value = 0;
    }
  }

  void addNewElement() {
    numberOfDrinks.add(0.obs);
  }
}

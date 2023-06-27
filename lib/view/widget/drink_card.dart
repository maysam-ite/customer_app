// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
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
    DrinkCardContrller controller = Get.put(
      DrinkCardContrller(),
      tag: drink.hashCode.toString(),
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
        width: size.drinkCardWidth,
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
                                controller.numberOfDrinks.value.toString(),
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

  Widget addRemoveButton(String addOrRemove, DrinkCardContrller controller) {
    return SizedBox(
      width: 60,
      child: MaterialButton(
        onPressed: () {
          addOrRemove == 'add'
              ? controller.increaseTheNumberOfDrinks()
              : controller.decreaseTheNumberOfDrinks();
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
  String name;
  int unitPriceInSP;
  Drink({
    required this.name,
    required this.unitPriceInSP,
  });
}

class DrinkCardContrller extends GetxController {
  RxInt numberOfDrinks = 0.obs;
  void increaseTheNumberOfDrinks() {
    numberOfDrinks.value++;
  }

  void decreaseTheNumberOfDrinks() {
    numberOfDrinks > 0 ? numberOfDrinks.value-- : null;
  }
}

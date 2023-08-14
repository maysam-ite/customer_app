// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:customer_app/view/widget/general_text_style.dart';
import 'package:customer_app/view/widget/my_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:customer_app/view/widget/drink_card.dart';

import '../../../constant/font.dart';
import '../../../constant/sizes.dart';
import '../../../constant/theme.dart';
import '../../../data/Models/drink_model.dart';
import '../../widget/animation_title.dart';
import 'cart_controller.dart';

// ignore: must_be_immutable
class CartPage extends StatelessWidget {
  CartPage({super.key});
  CartController controller = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    final Sizes size = Sizes(context);
    return Scaffold(
      appBar: createAppBar(size),
      body: Column(
        children: [
          SizedBox(
            height: Get.size.height * .75,
            child: ListView.builder(
                itemCount: controller.order.drinksWithAmount.length,
                itemBuilder: ((context, index) {
                  print(index);
                  return cartCard(controller.order, index, context, size);
                  // cartElement(order, index, context, size)
                })),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '${'Total price'.tr}: ${controller.order.calculateTotalPrice()}S.P',
              style: TextStyle(
                fontFamily: jostFontFamily,
                color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: MyButton(
              mycolor: Get.isDarkMode ? darkPrimaryColor : primaryColor,
              myRadius: size.buttonRadius,
              ontap: () {
                print(controller.order.drinksWithAmount.length);
                controller.onpressDone();
                //send the data to the backend and go back to the prev page.
              },
              mywidth: size.normalButtonWidht,
              myheight: size.normalButtonHeight,
              myShadow: 0,
              child: AutoSizeText(
                'Done'.tr,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: size.normalButtonTextSize,
                    fontFamily: jostFontFamily,
                    color:
                        Get.isDarkMode ? skinColorWhite : backGroundDarkColor),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget cartCard(
      MakeOrder order, int index, BuildContext context, Sizes size) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(
            color: Get.isDarkMode ? darkPrimaryColor : primaryColor,
            width: 1.0,
          ),
        ),
        color: Get.isDarkMode
            ? const Color.fromARGB(255, 77, 77, 77)
            : Colors.grey[400],
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                order.drinksWithAmount[index].drink.name,
                style: TextStyle(
                  fontFamily: jostFontFamily,
                  color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text('${'Price'.tr}: \$${order.calculatePrice(index)} S.P',
                  style: generalTextStyle(16)),
              const SizedBox(height: 8),
              Text(
                  '${'Amount Ordered'.tr}: ${order.drinksWithAmount[index].amount}',
                  style: generalTextStyle(16)),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget? createAppBar(Sizes size) {
    DrinkCardController drinkCardController = Get.find();
    return AppBar(
      leading: BackButton(
        onPressed: () {
          Get.back();
          Future.delayed(const Duration(milliseconds: 80), () {
            drinkCardController.order.makeTheOrderEmpty();
            drinkCardController.makeTheNumberofDriknsEqualsZero();
          });
        },
      ),
      iconTheme: IconThemeData(
          color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor),
      elevation: 0.4,
      backgroundColor: Get.isDarkMode ? darkPrimaryColor : primaryColor,
      title: AnimationAppBarTitle(title: 'Cart page'.tr),
      actions: [
        IconButton(
          icon: Icon(
            Icons.search,
            color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor,
            size: size.appBarIconSize,
          ),
          onPressed: () {
            // Perform search action
          },
        ),
      ],
    );
  }
}

class MakeOrder {
  List<DrinkAmount> drinksWithAmount = [];
  double calculatePrice(int id) {
    double price = 0;
    for (int i = 0; i < drinksWithAmount[id].amount.toInt(); i++) {
      price += drinksWithAmount[id].drink.price;
    }
    return price;
  }

  double calculateTotalPrice() {
    double totalPrice = 0;
    for (var element in drinksWithAmount) {
      for (int i = 0; i < element.amount; i++) {
        totalPrice += element.drink.price;
      }
    }
    return totalPrice;
  }

  void makeTheOrderEmpty() {
    drinksWithAmount = [];
  }
}

class DrinkAmount {
  DrinkModel drink;
  int amount;
  DrinkAmount({
    required this.drink,
    required this.amount,
  });
}

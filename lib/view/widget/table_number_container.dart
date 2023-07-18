import 'package:customer_app/constant/theme.dart';
import 'package:customer_app/view/widget/general_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget sectionNumberContainer(int sectionNumber) {
  return Align(
    alignment: Alignment.center,
    child: GestureDetector(
      onTap: () {},
      child: Container(
        height: 35,
        width: 35,
        decoration: BoxDecoration(
            border: Border.all(
                color: Get.isDarkMode ? backGroundDarkColor : skinColorWhite!,
                width: 0.5),
            color: Get.isDarkMode ? darkPrimaryColor : primaryColor,
            shape: BoxShape.circle),
        child: Center(
            child: Text(
          sectionNumber.toString(),
          style: generalTextStyle(20),
        )),
      ),
    ),
  );
}
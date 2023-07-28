import 'package:customer_app/constant/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../main.dart';
import '../../widget/table_number_container.dart';
import '../bar/bar_page_controller.dart';

Widget places(BarPageController controller) {
  return TabBarView(
    controller: controller.tabControllerAppbarBottom,
    children: [
      Column(
        children: [
          Expanded(child: firstPlacesBody()),
        ],
      ),
      Column(
        children: [Expanded(child: secondPlacesBody())],
      ),
    ],
  );
}

Widget firstPlacesBody() {
  return Padding(
    padding: const EdgeInsets.only(bottom: 90),
    child: SizedBox(
      height: Get.size.height * .65,
      width: Get.size.width * .98,
      child: Stack(
        children: [
          table(10, null, Get.size.width * .5 - 90, null, [1, 2, 3], true),
          table(
              Get.size.height * .5 / 2 - 90, null, 10, null, [4, 5, 6], false),
          table(
              Get.size.height * .5 / 2 - 90, null, null, 10, [7, 8, 9], false),
          singlePart(null, Get.size.height * .6 / 2 - 90, 10, null, 10),
          singlePart(null, Get.size.height * .6 / 2 - 90, null, 10, 11),
          singlePart(null, Get.size.height * .6 - 60, 10, null, 12),
          middelTable([13, 14, 15, 16]),
        ],
      ),
    ),
  );
}

Widget secondPlacesBody() {
  return Padding(
    padding: const EdgeInsets.only(bottom: 30),
    child: SizedBox(
      height: Get.size.height * .65,
      width: Get.size.width * .98,
      child: Stack(
        children: [
          table(
              Get.size.height * .5 / 2 - 30, null, 100, null, [1, 2, 3], false),
          table(
              Get.size.height * .5 / 2 - 30, null, 10, null, [4, 5, 6], false),
          table(
              Get.size.height * .5 / 2 - 30, null, 190, null, [7, 8, 9], false),
          singlePart(null, Get.size.height * .6 / 2 - 90, 10, null,
              10), //this one should be in the top wall
          singlePart(null, Get.size.height * .6 / 2 - 90, null, 10,
              11), //this one should be in the top wall
          singlePart(null, Get.size.height * .6 - 60, 10, null,
              12), //this one should be in the top wall
          singlePart(null, Get.size.height * .6 - 60, 10, null,
              12), //this one should be in the bottom wall
          singlePart(null, Get.size.height * .6 - 60, 10, null,
              12), //this one should be in the bottom wall
          singlePart(null, Get.size.height * .6 - 60, 10, null,
              12), //this one should be in the start wall in the left
          singlePart(null, Get.size.height * .6 - 60, 10, null,
              12), //this one should be in the start wall in the right
        ],
      ),
    ),
  );
}

Widget middelTable(List<int> sectionsNumbers) {
  return Positioned(
    top: Get.size.height * .65 / 2,
    left: Get.size.width * .95 / 2 - 60,
    child: Column(
      children: [
        Row(
          children: [
            middleTablePart(
                sharedPreferences!.getString('lang') == 'en'
                    ? 100
                    : sharedPreferences!.getString('lang') == 'ar'
                        ? 0
                        : 100,
                sharedPreferences!.getString('lang') == 'en'
                    ? 0
                    : sharedPreferences!.getString('lang') == 'ar'
                        ? 100
                        : 0,
                0,
                0,
                sectionsNumbers[0]),
            middleTablePart(
                sharedPreferences!.getString('lang') == 'en'
                    ? 0
                    : sharedPreferences!.getString('lang') == 'ar'
                        ? 100
                        : 0,
                sharedPreferences!.getString('lang') == 'en'
                    ? 100
                    : sharedPreferences!.getString('lang') == 'ar'
                        ? 0
                        : 100,
                0,
                0,
                sectionsNumbers[1]),
          ],
        ),
        Row(
          children: [
            middleTablePart(
                0,
                0,
                sharedPreferences!.getString('lang') == 'en'
                    ? 0
                    : sharedPreferences!.getString('lang') == 'ar'
                        ? 100
                        : 0,
                sharedPreferences!.getString('lang') == 'en'
                    ? 100
                    : sharedPreferences!.getString('lang') == 'ar'
                        ? 0
                        : 100,
                sectionsNumbers[3]),
            middleTablePart(
                0,
                0,
                sharedPreferences!.getString('lang') == 'en'
                    ? 100
                    : sharedPreferences!.getString('lang') == 'ar'
                        ? 0
                        : 100,
                sharedPreferences!.getString('lang') == 'en'
                    ? 0
                    : sharedPreferences!.getString('lang') == 'ar'
                        ? 100
                        : 0,
                sectionsNumbers[2]),
          ],
        ),
      ],
    ),
  );
}

Widget middleTablePart(double topLeft, double topRight, double bottomRight,
    double bottomLeft, int sectionNumber) {
  return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: tablesColor,
        border: Border.all(
            color: Get.isDarkMode ? skinColorWhite! : backGroundDarkColor,
            width: 0.5),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(bottomLeft),
          topLeft: Radius.circular(topLeft),
          bottomRight: Radius.circular(bottomRight),
          topRight: Radius.circular(topRight),
        ),
      ),
      child: sectionNumberContainer(sectionNumber));
}

Widget singlePart(double? bottom, double? top, double? left, double? right,
    int sectionNumber) {
  return Positioned(
      top: top,
      right: right,
      left: left,
      bottom: bottom,
      child: tablePart(sectionNumber));
}

Widget table(double? bottom, double? top, double? left, double? right,
    List<int> sectionsNumber, bool isHorizontal) {
  return Positioned(
      top: top,
      right: right,
      bottom: bottom,
      left: left,
      child: isHorizontal
          ? Row(children: [
              tablePart(sectionsNumber[0]),
              tablePart(sectionsNumber[1]),
              tablePart(sectionsNumber[2]),
            ])
          : Column(children: [
              tablePart(sectionsNumber[0]),
              tablePart(sectionsNumber[1]),
              tablePart(sectionsNumber[2]),
            ]));
}

Widget tablePart(int sectionNumber) {
  return Container(
    width: 60,
    height: 50,
    decoration: BoxDecoration(
        border: Border.all(
            color: Get.isDarkMode ? skinColorWhite! : backGroundDarkColor,
            width: 0.5),
        color: tablesColor),
    child: sectionNumberContainer(sectionNumber),
  );
}

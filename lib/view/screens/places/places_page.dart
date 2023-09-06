import 'package:customer_app/constant/theme.dart';
import 'package:customer_app/view/screens/places/places_controller.dart';
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
          table(5, null, Get.size.width * .85 / 2 - 60, null, [1, 2, 3], true),
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
          //the middel tables.
          table(110, null, Get.size.width * .5 - 35, null, [17, 18, 19], false),
          table(260, null, Get.size.width * .5 - 35, null, [20, 21, 22], false),
          //the chairs on the right
          table(130, null, Get.size.width * .8, null, [23, 24, 25], false),
          singlePart(280, null, Get.size.width * .8, null, 26),
          //the chairs behind the band
          singlePart(410, null, Get.size.width * .8, null, 27),
          singlePart(480, null, Get.size.width * .8, null, 28),
          //the double chair on the bottom
          singlePart(25, null, Get.size.width * .5 - 35, null, 29),
          //the chairs on the right
          singlePart(270, null, Get.size.width * .12, null, 32),
          singlePart(170, null, Get.size.width * .12, null, 31),
          singlePart(70, null, Get.size.width * .12, null, 30),
          //the double chairs on the stage.
          singlePart(null, 100, 5, null, 33),
        ],
      ),
    ),
  );
}

Widget middelTable(List<int> sectionsNumbers) {
  return Positioned(
    top: Get.size.height * .5 / 2,
    left: Get.size.width * .95 / 2 - 60,
    child: Column(
      children: [
        Row(
          children: [
            middelTablePart(
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
            middelTablePart(
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
            middelTablePart(
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
            middelTablePart(
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

Widget middelTablePart(double topLeft, double topRight, double bottomRight,
    double bottomLeft, int sectionNumber) {
      PlacesController dataController=Get.find();
  
  return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: dataController.section.value==sectionNumber?  Get.isDarkMode?primaryColor:darkPrimaryColor :tablesColor,
        border: Border.all(
            color:Get.isDarkMode?skinColorWhite!:backGroundDarkColor ,width: 0.5),
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
              tablePart(sectionsNumber[2]),
              tablePart(sectionsNumber[1]),
              tablePart(sectionsNumber[0]),
            ])
          : Column(children: [
              tablePart(sectionsNumber[2]),
              tablePart(sectionsNumber[1]),
              tablePart(sectionsNumber[0]),
            ]));
}

Widget tablePart(int sectionNumber) {
       PlacesController dataController=Get.find();
  return GestureDetector(
    onTap: () {
          dataController.section.value=sectionNumber;
         
    },
    child: Obx(
      ()=>Container(
        width: 60,
        height: 50,

        decoration: BoxDecoration(
            border: Border.all(
                color: Get.isDarkMode ? skinColorWhite! : backGroundDarkColor,
                width: 0.5),
            color: dataController.section.value==sectionNumber?  Get.isDarkMode?primaryColor:darkPrimaryColor :tablesColor),
        child: sectionNumberContainer(sectionNumber),
      ),
    ),
  );
}

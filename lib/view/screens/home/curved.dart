import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:customer_app/constant/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controlle.dart';

Widget c() {
  G controller = Get.find();
  return CurvedNavigationBar(
    color: Colors.black,
    buttonBackgroundColor: Colors.amber,
    items: controller.items,
    index: controller.index.value,
    onTap: (selctedIndex) {
   
      controller.selectedIndex.value = selctedIndex;
     
    },
    height: 70,
    backgroundColor: lightHoverButtonColor,
    animationDuration: const Duration(milliseconds: 300),
    // animationCurve: ,
  );
}

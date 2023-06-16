import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:customer_app/view/screens/home/home2.dart';
import 'package:customer_app/view/screens/home/home4.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home3.dart';

class G extends GetxController {
  final selectedIndex = 0.obs;
    RxInt index = 1.obs;
    
// final GlobalKey<CurvedNavigationBarState> navigationBarKey = GlobalKey();
// void animateToPage(int index) {
//     selectedIndex.value = index;
//     navigationBarKey.currentState?.setPage(index);
//   }

  
  final items = const [
    Icon(Icons.people, size: 30,),
    Icon(Icons.person, size: 30,),
    Icon(Icons.add, size: 30,),
    Icon(Icons.search_outlined, size: 30,)
  ];
  // void changePage(int index) {
  //   print(index);
  //   selectedIndex.value = index;
  //   switch (index) {
  //     case 0:
  //       Get.offNamed('/Home');
  //       break;
  //     case 1:
  //       Get.offNamed('/Home2');
  //       break;
  //     case 2:
  //       Get.offNamed('/Home3');
  //       break;
  //     case 3:
  //       Get.offNamed('/Home4');
  //       break;
  //   }
  // }
}

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controlle.dart';
import 'curved.dart';
import 'home2.dart';
import 'home3.dart';
import 'home4.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final G controller = Get.find();
  int index = 1;
  // GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Obx( () => getSelectedWidget()),
        bottomNavigationBar: c());
  }

  Widget getSelectedWidget() {
    print(controller.selectedIndex.value);
    Widget widget;
    switch (controller.selectedIndex.value) {
      case 0:
        widget = Home2();
        break;
      case 1:
        widget = Home3();
        
        break;
      case 2:
        widget = Home4();
        break;
      default:
        widget = Home4();
        break;
    }
    
    return widget;
  }
}

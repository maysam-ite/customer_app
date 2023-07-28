import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BarPageController extends GetxController with GetTickerProviderStateMixin{
  RxInt page = 0.obs;
late TabController? tabControllerAppbarBottom ;
late TabController? tabControllerBottomNavBar ;
 @override
  void onInit() {
    super.onInit();
    tabControllerAppbarBottom = TabController(length: 2, vsync: this);
    tabControllerBottomNavBar = TabController(length: 1, vsync: this);
  }

  void changePage(int index) {
    page.value = index;
  }
  
  @override
  void onClose() {
    tabControllerAppbarBottom!.dispose();
    tabControllerBottomNavBar!.dispose();
    super.onClose();
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BarPageController extends GetxController with GetSingleTickerProviderStateMixin{
  RxInt page = 0.obs;
TabController? tabController ;
 @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
  }

  void changePage(int index) {
    page.value = index;
  }
}

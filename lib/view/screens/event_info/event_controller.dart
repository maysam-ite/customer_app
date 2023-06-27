import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventInfoController extends GetxController {
  final RxInt pageIndex = 0.obs;
  final PageController pageController = PageController();

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  void setPageIndex(int index) {
    pageIndex.value = index;
  }

  void onSlide(int direction) {
    if (direction == 1) {
      pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
    } else {
      pageController.previousPage(
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
    }
  }
}

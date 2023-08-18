import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/status_request.dart';
import '../../../general_controllers/statuse_request_controller.dart';
import '../../../main.dart';
import '../../widget/snak_bar_for_errors.dart';
import '../cart/cart_service.dart.dart';

class BarPageController extends GetxController
    with GetTickerProviderStateMixin {
  RxInt page = 0.obs;
  late TabController? tabControllerAppbarBottom;
  late TabController? tabControllerBottomNavBar;
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



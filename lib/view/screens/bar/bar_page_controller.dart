import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../main.dart';
import 'bar_page_service.dart';

class BarPageController extends GetxController
    with GetTickerProviderStateMixin {
  RxInt page = 0.obs;
  late TabController? tabControllerAppbarBottom;
  late TabController? tabControllerBottomNavBar;
  bool isReservationConfirmed=false;
  bool isPlaceSet=false;
  late int customer_id;
  late String resevationId;
  BarPageService service=BarPageService();
  @override
  void onInit() {
    try{

    customer_id=Get.arguments;
    tabControllerAppbarBottom = TabController(length: 2, vsync: this);
    tabControllerBottomNavBar = TabController(length: 1, vsync: this);

    }catch(e){
      prefService.remove('token');
      Get.offAllNamed('/');

    }
    super.onInit();
  }

  void changePage(int index) {
    // if(index==1 && isReservationConfirmed){

    // page.value = index;
    // }
    // if(index==2 && isPlaceSet){

    // page.value = index;
    // }
    // if(index==0){

    page.value = index;
    // }
  }

  @override
  void onClose() {
    tabControllerAppbarBottom!.dispose();
    tabControllerBottomNavBar!.dispose();
    super.onClose();
  }
}

import 'package:get/get.dart';

class BarPageController extends GetxController {
  RxInt page = 0.obs;
  void changePage(int index) {
    page.value = index;
  }
}

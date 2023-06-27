import 'package:get/get.dart';
import 'bar_page_controller.dart';

class BarPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BarPageController());
  }
}

import 'package:get/get.dart';

import 'event_controller.dart';

class EventInfoBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(EventInfoController());
  }
}

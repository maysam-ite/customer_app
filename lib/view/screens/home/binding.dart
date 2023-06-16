import 'package:get/get.dart';

import 'controlle.dart';

class cBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(G());
  }
}

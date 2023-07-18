import 'package:get/get.dart';

import 'places_controller.dart';

class PlacesBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(PlacesController());
  }
}

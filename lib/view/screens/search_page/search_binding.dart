import 'package:customer_app/view/screens/search_page/search_page_controller.dart';
import 'package:get/get.dart';

class SearchBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(GeneralSearchController());
  }
}

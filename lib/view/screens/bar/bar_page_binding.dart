import 'package:get/get.dart';
import '../../widget/event_card.dart';
import 'bar_page_controller.dart';

class BarPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BarPageController());
    Get.put(EventCardController());
    print('what the fuck');
  }
}

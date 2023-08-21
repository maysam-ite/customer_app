import 'package:get/get.dart';
import '../../widget/event_card.dart';
import '../places/places_controller.dart';
import 'bar_page_controller.dart';

class BarPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BarPageController());
    Get.put(EventCardController());
    Get.put(PlacesController());
    print('what the fuck');
  }
}

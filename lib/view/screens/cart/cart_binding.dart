import 'package:customer_app/view/screens/cart/cart_controller.dart';
import 'package:get/get.dart';

class CartBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(CartController());
  }
}

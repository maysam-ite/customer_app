import 'package:customer_app/view/screens/setting/language_controller.dart';
import 'package:customer_app/view/screens/setting/setting_controller.dart';
import 'package:customer_app/view/screens/setting/theme_controller.dart';
import 'package:get/get.dart';

class SettingBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SettingController());
    Get.put(ThemeController());
    Get.put(LanguageController());
  }
}

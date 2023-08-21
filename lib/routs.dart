import 'package:customer_app/view/screens/bar/bar_page.dart';
import 'package:customer_app/view/screens/bar/bar_page_binding.dart';
import 'package:customer_app/view/screens/cart/cart_binding.dart';
import 'package:customer_app/view/screens/cart/cart_page.dart';
import 'package:customer_app/view/screens/event_info/event_binding.dart';
import 'package:customer_app/view/screens/event_info/event_info_page.dart';
import 'package:customer_app/view/screens/landing/landing.dart';
import 'package:customer_app/view/screens/login/login_binding.dart';
import 'package:customer_app/view/screens/login/login_page.dart';
import 'package:customer_app/view/screens/register/register_binding.dart';
import 'package:customer_app/view/screens/search_page/search_binding.dart';
import 'package:customer_app/view/screens/search_page/search_page.dart';
import 'package:customer_app/view/screens/setting/setting_binding.dart';
import 'package:get/get.dart';
import 'view/screens/register/register_page.dart';

appRoutes() => [
      GetPage(
        name: '/',
        page: () => Landing(),
      ),
      GetPage(
          name: '/LoginPage', page: () => LoginPage(), binding: LoginBinding()),
      GetPage(
          name: '/EventInfo',
          page: () => EventInfo(),
          binding: EventInfoBinding()),
      GetPage(
          name: '/Bar',
          page: () => BarPage(),
          bindings: [BarPageBinding(), SettingBinding()]),
      GetPage(
          name: '/Register',
          page: () => RegisterPage(),
          binding: RegisterBinding()),
      GetPage(name: '/Cart', page: () => CartPage(), binding: CartBinding()),
      GetPage(
          name: '/SearchPage',
          page: () => SearchPage(),
          binding: SearchBinding()),
    ];

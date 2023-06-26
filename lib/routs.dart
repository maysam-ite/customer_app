
import 'package:customer_app/view/screens/landing/landing.dart';
import 'package:customer_app/view/screens/login/login_binding.dart';
import 'package:customer_app/view/screens/login/login_page.dart';
import 'package:customer_app/view/screens/register/register_binding.dart';
import 'package:get/get.dart';
import 'view/screens/register/register_page.dart';

appRoutes() => [
      GetPage(name: '/', page: () => Landing()/*, binding: ThemeBinding()*/),
      GetPage(
          name: '/LoginPage', page: () => LoginPage(), binding: LoginBinding()),
      GetPage(
          name: '/Register', page: () => RegisterPage(), binding: RegisterBinding()),
     

    ];



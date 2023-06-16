
import 'package:customer_app/view/screens/landing/landing.dart';
import 'package:customer_app/view/screens/login/login_binding.dart';
import 'package:customer_app/view/screens/login/login_page.dart';
import 'package:customer_app/view/screens/register/register_binding.dart';
import 'package:get/get.dart';

import 'view/screens/home/binding.dart';
import 'view/screens/home/home.dart';
import 'view/screens/home/home2.dart';
import 'view/screens/home/home3.dart';
import 'view/screens/home/home4.dart';
import 'view/screens/register/register_page.dart';

appRoutes() => [
      GetPage(name: '/', page: () => Landing()/*, binding: ThemeBinding()*/),
      GetPage(
          name: '/LoginPage', page: () => LoginPage(), binding: LoginBinding()),
      GetPage(
          name: '/Register', page: () => RegisterPage(), binding: RegisterBinding()),
     
      GetPage(
        name: '/Home',
        page: () => Home(),
        // binding: cBinding()
      ), GetPage(
        name: '/Home2',
        page: () => Home2(),
        //  binding: cBinding()
      
      ), GetPage(
        name: '/Home3',
        page: () => Home3(),
        //  binding: cBinding()
      
      ), GetPage(
        name: '/Home4',
        page: () => Home4(),
        //  binding: cBinding()
      
      ),
      // GetPage(
      //     name: '/WorkerManagementPage',
      //     page: () => WorkerManagementPage(),
      //     bindings: [WorkerManagementBinding(), AddWorkerBinding()]),
      // GetPage(
      //     name: '/WorkerInformationPage',
      //     page: () =>  WorkerInfoPage(),
      //     bindings: [WorkerInformationBinding()]),
      
      // GetPage(
      //     name: '/AdminManagementPage',
      //     page: () => AdminManagementPage(),
      //     bindings: [AdminManagementBinding(), AddAdminBinding()]),
      // GetPage(
      //   name: '/EventPage',
      //   page: () => EventPage(),
      //   bindings: [AddEventBinding(), EventBinding()],
      // ),
      // GetPage(
      //   name: '/EventInformationPage',
      //   page: () => const EventInformationPage(),
      // ),
      // GetPage(
      //   name: '/StockPage',
      //   page: () => StockPage(),
      //   binding: StockBinding(),
      // ),
      //     GetPage(
      //   name: '/EventInformationPage',
      //   page: () => const EventInformationPage(),
      // ),
      // GetPage(
      //   name: '/StockPage',
      //   page: () => StockPage(),
      //   binding: StockBinding(),
      // ),
      // GetPage(
      //   name: '/DrinkInformationPage',
      //   page: () => const DrinkInformationPage(),
      // ),

    ];



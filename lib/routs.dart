
import 'package:customer_app/view/screens/landing/landing.dart';
import 'package:customer_app/view/screens/login/login_binding.dart';
import 'package:customer_app/view/screens/login/login_page.dart';
import 'package:get/get.dart';

appRoutes() => [
      GetPage(name: '/', page: () => Landing()/*, binding: ThemeBinding()*/),
      GetPage(
          name: '/LoginPage', page: () => LoginPage(), binding: LoginBinding()),
      // GetPage(
      //   name: '/',
      //   page: () => Home(),
      // ),
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



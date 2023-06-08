import 'package:customer_app/view/screens/landing/landing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'constant/theme.dart';
import 'data/service/pref_service.dart';
import 'general_controllers/general_binding.dart';
import 'languages/translations.dart';
import 'routs.dart';
import 'view/screens/setting/language_controller.dart';

SharedPreferences? sharedPreferences;
PrefService prefService = PrefService();
late String themeValue;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  themeValue = await prefService.readString("theme");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LanguageController languageController = Get.put(LanguageController());

    return GetMaterialApp(
        scrollBehavior: AppScrollBehavior(),
        locale: languageController.initialLanguage,
        fallbackLocale: const Locale(
            'en'), //when something wrong happend with the start languege
        translations: Translation(),
        debugShowCheckedModeBanner: false,
        title: 'Dash board',
        theme: themeValue == "dark"
            ? Themes.customdarktheme
            : Themes.customlighttheme,
        initialBinding: GeneralBinding(),
        themeMode: ThemeMode
            .light, //to make the app change theme even if the device theme is dark.
        initialRoute: '/',
        getPages: appRoutes());
  }
}

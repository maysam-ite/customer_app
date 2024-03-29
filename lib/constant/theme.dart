import 'package:customer_app/constant/font.dart';
import 'package:customer_app/view/widget/general_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Color? tablesColor = Get.isDarkMode ? backGroundDarkColor : skinColorWhite;
//for light mode
Color primaryColor =
    Colors.teal[300]!; //const Color.fromARGB(1, 43, 120, 97); //done
Color lightHoverButtonColor = Colors.teal[400]!;
Color woodBrownColor = Colors.blueGrey[400]!;
//Colors.brown; // const Color.fromARGB(255, 54, 33, 20); //done
Color? skinColorWhite =
    Colors.brown[50]; // const Color.fromARGB(255, 226, 212, 172); //done

//for the dark mode:
Color darkPrimaryColor =
    Colors.teal[500]!; // Colors.red[500]!; //Colors.teal[900]!;
Color darkHoverButtonColor =
    Colors.teal[600]!; // Colors.red[600]!; //Colors.teal[800]!;
Color darkWoodBrownColor = Colors.blueGrey[800]!;
Color backGroundDarkColor = Colors.black87;

/*---------------*/
class Themes {
  static ThemeData customdarktheme = ThemeData.dark().copyWith(
    datePickerTheme: DatePickerThemeData(
      headerHelpStyle: generalTextStyle(null),
      headerHeadlineStyle: generalTextStyle(null),
      yearBackgroundColor: MaterialStateProperty.all<Color?>(
          darkPrimaryColor), //the color of the years button
      surfaceTintColor: Colors.blueGrey,
      dayBackgroundColor: MaterialStateProperty.all<Color?>(
          darkPrimaryColor), //the color of the days button
      todayBackgroundColor: MaterialStateProperty.all<Color?>(
          darkHoverButtonColor), //the color of today button.
      headerForegroundColor: skinColorWhite, //the color of the foreGround text
      backgroundColor: backGroundDarkColor,
      yearOverlayColor:
          MaterialStateProperty.all<Color?>(skinColorWhite), //hovring
      dayForegroundColor: MaterialStateProperty.all<Color?>(skinColorWhite),
      yearForegroundColor: MaterialStateProperty.all<Color?>(skinColorWhite),
      todayForegroundColor: MaterialStateProperty.all<Color?>(skinColorWhite),
      headerBackgroundColor: darkPrimaryColor,
      //don't know what they do!
      rangeSelectionOverlayColor:
          MaterialStateProperty.all<Color?>(Colors.deepPurple),
      rangePickerBackgroundColor: Colors.red,
      rangePickerSurfaceTintColor: Colors.pink,
      rangeSelectionBackgroundColor: Colors.green,
      rangePickerHeaderBackgroundColor: Colors.blue,
      rangePickerHeaderForegroundColor: Colors.yellow,
      //don't know what they do!
      dayOverlayColor:
          MaterialStateProperty.all<Color?>(darkHoverButtonColor), //hovring
      yearStyle: generalTextStyle(null),
      dayStyle: generalTextStyle(null),
      weekdayStyle: generalTextStyle(null),
    ),

    listTileTheme: ListTileThemeData(
      iconColor: darkPrimaryColor,
    ),
    primaryIconTheme: IconThemeData(color: darkPrimaryColor),

    buttonTheme: ButtonThemeData(
        colorScheme: ColorScheme(
            brightness: Brightness.dark,
            primary: darkPrimaryColor,
            onPrimary: darkPrimaryColor,
            secondary: darkWoodBrownColor,
            onSecondary: darkWoodBrownColor,
            error: darkWoodBrownColor,
            onError: darkWoodBrownColor,
            background: backGroundDarkColor,
            onBackground: backGroundDarkColor,
            surface: darkPrimaryColor,
            onSurface: darkPrimaryColor)),
    primaryTextTheme: TextTheme(
        displayLarge: TextStyle(color: skinColorWhite, fontFamily: 'Jost'),
        bodyLarge: TextStyle(color: skinColorWhite, fontFamily: 'Jost'),
        displayMedium: TextStyle(color: skinColorWhite, fontFamily: 'Jost'),
        displaySmall: TextStyle(color: skinColorWhite, fontFamily: 'Jost')),
    dialogBackgroundColor: backGroundDarkColor,
    iconTheme: IconThemeData(color: darkPrimaryColor),
    hintColor: darkPrimaryColor, //hint text color
    dividerColor: darkPrimaryColor, //control the divider color
    drawerTheme: DrawerThemeData(
      backgroundColor: darkPrimaryColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
    ),
    focusColor: darkWoodBrownColor,
    textTheme: TextTheme(
        displayLarge:
            TextStyle(color: Colors.white, fontFamily: jostFontFamily),
        displayMedium:
            TextStyle(color: Colors.white, fontFamily: jostFontFamily),
        displaySmall:
            TextStyle(color: Colors.white, fontFamily: jostFontFamily)),
    primaryColor: darkPrimaryColor,
    secondaryHeaderColor: darkWoodBrownColor,
    appBarTheme: AppBarTheme(
      actionsIconTheme: IconThemeData(color: darkPrimaryColor),

      titleTextStyle: TextStyle(
          color: skinColorWhite,
          fontFamily:
              jostFontFamily), //controller the color of the appbar text.
      iconTheme: IconThemeData(color: backGroundDarkColor),

      color: backGroundDarkColor.withOpacity(
          0.1), //here to control the app bar color "and it's the same whit background color".
    ),
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary:
          skinColorWhite!, //the appBar colors(but know I control it from appBarTheme) and the text colors in the container and the pointer in the test field.
      onPrimary:
          skinColorWhite!, //control the color of the title on the appBar.
      secondary: darkPrimaryColor,
      onSecondary: skinColorWhite!,
      primaryContainer: Colors.blueGrey,
      error: Colors.black,
      onError: Colors.black,
      background: Colors
          .black, //darckPrimaryColor //the chatGPT say that it will control the color for all the backgrounds in the app
      onBackground: Colors.brown,
      surface: darkPrimaryColor,
      onSurface: Colors.white,
    ),

    brightness: Brightness.dark,
    disabledColor:
        backGroundDarkColor, //the things that the primary color don't effect like the  checkboxes, text fields...I am not sure about the Buttons
  );

  ///

  static ThemeData customlighttheme = ThemeData.light().copyWith(
    listTileTheme: ListTileThemeData(
      iconColor: primaryColor,
    ),
    datePickerTheme: DatePickerThemeData(
      headerHelpStyle: generalTextStyle(null),
      headerHeadlineStyle: generalTextStyle(null),
      yearBackgroundColor: MaterialStateProperty.all<Color?>(
          primaryColor), //the color of the years button
      surfaceTintColor: Colors.blueGrey,
      dayBackgroundColor: MaterialStateProperty.all<Color?>(
          primaryColor), //the color of the days button
      todayBackgroundColor: MaterialStateProperty.all<Color?>(
          lightHoverButtonColor), //the color of today button.
      headerForegroundColor:
          backGroundDarkColor, //the color of the foreGround text
      backgroundColor: skinColorWhite,
      yearOverlayColor:
          MaterialStateProperty.all<Color?>(backGroundDarkColor), //hovring
      dayForegroundColor:
          MaterialStateProperty.all<Color?>(backGroundDarkColor),
      yearForegroundColor:
          MaterialStateProperty.all<Color?>(backGroundDarkColor),
      todayForegroundColor:
          MaterialStateProperty.all<Color?>(backGroundDarkColor),
      headerBackgroundColor: primaryColor,
      //don't know what they do!
      rangeSelectionOverlayColor:
          MaterialStateProperty.all<Color?>(Colors.deepPurple),
      rangePickerBackgroundColor: Colors.red,
      rangePickerSurfaceTintColor: Colors.pink,
      rangeSelectionBackgroundColor: Colors.green,
      rangePickerHeaderBackgroundColor: Colors.blue,
      rangePickerHeaderForegroundColor: Colors.yellow,
      //don't know what they do!
      dayOverlayColor:
          MaterialStateProperty.all<Color?>(lightHoverButtonColor), //hovring
      yearStyle: generalTextStyle(null),
      dayStyle: generalTextStyle(null),
      weekdayStyle: generalTextStyle(null),
    ),

    primaryIconTheme: IconThemeData(color: primaryColor),
    buttonTheme: ButtonThemeData(
        colorScheme: ColorScheme(
            brightness: Brightness.light,
            primary: primaryColor,
            onPrimary: primaryColor,
            secondary: woodBrownColor,
            onSecondary: woodBrownColor,
            error: woodBrownColor,
            onError: woodBrownColor,
            background: skinColorWhite!,
            onBackground: skinColorWhite!,
            surface: primaryColor,
            onSurface: primaryColor)),

    primaryTextTheme: TextTheme(
        displayLarge: TextStyle(color: backGroundDarkColor, fontFamily: 'Jost'),
        bodyLarge: TextStyle(color: backGroundDarkColor, fontFamily: 'Jost'),
        displayMedium:
            TextStyle(color: backGroundDarkColor, fontFamily: 'Jost'),
        displaySmall:
            TextStyle(color: backGroundDarkColor, fontFamily: 'Jost')),
    dialogBackgroundColor: primaryColor,
    iconTheme: IconThemeData(color: primaryColor),
    hintColor: primaryColor, //hint text color
    dividerColor: primaryColor, //control the divider color
    drawerTheme: DrawerThemeData(
      backgroundColor: primaryColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
    ),
    focusColor: woodBrownColor,
    textTheme: TextTheme(
        displayLarge:
            TextStyle(color: Colors.black, fontFamily: jostFontFamily),
        displayMedium:
            TextStyle(color: Colors.black, fontFamily: jostFontFamily),
        displaySmall:
            TextStyle(color: Colors.black, fontFamily: jostFontFamily)),
    primaryColor: primaryColor,
    secondaryHeaderColor: woodBrownColor,
    appBarTheme: AppBarTheme(
      actionsIconTheme: IconThemeData(color: primaryColor),
      titleTextStyle:
          TextStyle(color: Colors.black, fontFamily: jostFontFamily),
      iconTheme: IconThemeData(color: skinColorWhite),
      color:
          skinColorWhite, //here to control the app bar color "and it's the same whit background color".
    ),
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary:
          backGroundDarkColor, //the appBar colors(but know I control it from appBarTheme) and the text colors in the container and the pointer in the test field.
      onPrimary:
          skinColorWhite!, //control the color of the title on the appBar.
      secondary: primaryColor,
      onSecondary: backGroundDarkColor,
      primaryContainer: Colors.blueGrey,
      error: Colors.black,
      onError: Colors.black,
      background: Colors
          .black, //primaryColor //the chatGPT say that it will control the color for all the backgrounds in the app
      onBackground: Colors.brown,
      surface: primaryColor, //the color of the date picker and stuff.
      onSurface: backGroundDarkColor,
    ),

    brightness: Brightness.light,
    disabledColor:
        skinColorWhite, //the things that the primary color don't effect like the  checkboxes, text fields...I am not sure about the Buttons
  );
  // static ThemeData systemTheme = ThemeData..copyWith();
}

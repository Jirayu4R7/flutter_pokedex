import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Color colorBlack = Color(0xFF000000);
  static const Color colorWhite = Color(0xFFFFFFFF);
  static const Color kColorPrimary = Color(0xFF0A64A9);
  static const Color kColorPrimaryLight = Color(0xFF4B9DD6);
  static const Color kColorSecondary = Color(0xFFF19B82);

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    backgroundColor: Colors.white,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      unselectedItemColor: Colors.black,
      selectedItemColor: kColorSecondary,
      elevation: 0,
    ),
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
    textTheme: textTheme,
  );

  static const TextTheme textTheme = TextTheme(
    headline6: title,
    subtitle1: subtitle1,
    // bodyText1: body1,
    // bodyText2: body2,
  );

  static const TextStyle title = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 22,
    letterSpacing: 0.30,
  );

  static const TextStyle subtitle1 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 20,
  );

  static const TextStyle body1 = TextStyle(
    fontWeight: FontWeight.w300,
    fontSize: 16,
  );

  static const TextStyle body2 = TextStyle(
    fontWeight: FontWeight.w300,
    fontSize: 15,
    letterSpacing: 0.2,
  );
}

import 'package:flutter/material.dart';

class MyTheme {
  static Color primaryLight = const Color(0xff1976D2);
  static Color primaryDark = const Color(0xff111F41);
  static Color blackColor = const Color(0xff000000);
  static Color whiteColor = const Color(0xffFFFFFF);
  static Color greyTextColor = const Color(0xff606060);
  static Color lightGreyColor = const Color(0xffABABAB);
  static Color backgroundGreyColor = const Color(0xffD9D9D9);
  static ThemeData lightTheme = ThemeData(
    textTheme: TextTheme(
      titleLarge: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: blackColor,
          fontFamily: 'Cambo'),
      titleMedium: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: blackColor,
          fontFamily: 'Cambo'),
      titleSmall: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: blackColor,
          fontFamily: 'Cambo'),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    textTheme: TextTheme(
      titleLarge: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: whiteColor,
          fontFamily: 'Cambo'),
      titleMedium: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: whiteColor,
          fontFamily: 'Cambo'),
      titleSmall: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: whiteColor,
          fontFamily: 'Cambo'),
    ),
  );
}
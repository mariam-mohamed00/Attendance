import 'package:flutter/material.dart';

class MyTheme {
  static Color primaryLight = Color(0xff1976D2);
  static Color primaryDark = Color(0xff111F41);
  static Color blackColor = Color(0xff000000);
  static Color whiteColor = Color(0xffFFFFFF);
  static Color greyTextColor = Color(0xff606060);
  static Color lightgreyColor = Color(0xffABABAB);
  static Color backgroundGreyColor = Color(0xffD9D9D9);
//lightgreyColor
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
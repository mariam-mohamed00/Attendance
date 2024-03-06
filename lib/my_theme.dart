import 'package:flutter/material.dart';

class MyTheme {
  static Color primaryLight = Color(0xff1976D2);
  static Color blackColor = Color(0xff000000);
  static Color whiteColor = Color(0xffFFFFFF);
  static Color greyTextColor = Color(0xff606060);
  static Color lightgreyColor = Color(0xffABABAB);
  static Color backgroundGreyColor = Color(0xffD9D9D9);

  static ThemeData lightTheme = ThemeData(
    // appBarTheme: AppBarTheme(backgroundColor: primaryLight, elevation: 0,
    // centerTitle: true,
    //   shape: const RoundedRectangleBorder(
    //     borderRadius: BorderRadius.vertical(
    //     bottom: Radius.circular(40),
    // ),
    // ),
    //   ),

    textTheme: TextTheme(
      titleLarge: TextStyle(
          fontSize: 40, fontWeight: FontWeight.bold, color: blackColor),
      titleMedium: TextStyle(
          fontSize: 16, fontWeight: FontWeight.w400, color: blackColor),
      titleSmall: TextStyle(
          fontSize: 14, fontWeight: FontWeight.w600, color: lightgreyColor),
    ),
  );
}

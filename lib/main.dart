import 'package:attendance/splash.dart';
import 'package:flutter/material.dart';
import 'my_theme.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
      },
      theme: MyTheme.lightTheme,
    );
  }

}

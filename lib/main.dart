import 'package:attendance/BottomNavBar.dart';
import 'package:attendance/splash.dart';
import 'package:flutter/material.dart';

import 'login/login_screen.dart';
import 'my_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
       // BottomNavBar.routeName: (context) => BottomNavBar(),
        //LoginScreen.routeName: (context) => LoginScreen(),
        // HomeScreen.routeName: (context) => HomeScreen(),
        
      },
      theme: MyTheme.lightTheme,
    );
  }
}

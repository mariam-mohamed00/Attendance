import 'package:attendance/splash.dart';
import 'package:flutter/material.dart';

import 'home/HomeScreen.dart';
import 'home/tabs/scan/scan.dart';
import 'login/forget_password/forget_change_password.dart';
import 'login/forget_password/forget_code.dart';
import 'login/forget_password/forget_pass.dart';
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
        LoginScreen.routeName: (context) => LoginScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        ForgetPasswordScreen.routeName: (context) => ForgetPasswordScreen(),
        ForgetCode.routeName: (context) => ForgetCode(),
        ForgetChangePassword.routeName: (context) => ForgetChangePassword(),
        QRViewExample.routeName: (context) => QRViewExample()
      },
      theme: MyTheme.lightTheme,
    );
  }
}

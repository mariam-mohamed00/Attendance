import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import 'login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = 'Splash Screen';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 10,
      splashIconSize: 800,
      backgroundColor: Color(0xFF5786B9),
      splash: Image.asset(
        'assets/images/splash_screen.png',
      ),
      nextScreen: LoginScreen(),
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}

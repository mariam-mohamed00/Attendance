import 'package:attendance/home/tabs/profile/Profile.dart';
import 'package:attendance/home/tabs/settings/setting_change_password.dart';
import 'package:attendance/home/tabs/settings/setting_screen.dart';
import 'package:attendance/home/tabs/settings/theme/theme_screen.dart';
import 'package:attendance/providers/app_config_provider.dart';
import 'package:attendance/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home/HomeScreen.dart';
import 'home/tabs/scan/scan.dart';
import 'login/forget_password/forget_change_password.dart';
import 'login/forget_password/forget_code.dart';
import 'login/forget_password/forget_pass.dart';
import 'login/login_screen.dart';
import 'my_theme.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => AppConfigProvider(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

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
        Scan.routeName: (context) => Scan(),
        SettingChangePassword.routeName: (context) => SettingChangePassword(),
        Profile.routeName: (context) => Profile(),
        ThemeScreen.routeName: (context) => ThemeScreen(),
        SettingScreen.routeName: (context) => SettingScreen()
      },
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      themeMode: provider.appTheme,
    );
  }
}

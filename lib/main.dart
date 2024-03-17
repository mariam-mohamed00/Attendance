import 'package:attendance/providers/app_config_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home/HomeScreen.dart';
import 'home/tabs/profile/Profile.dart';
import 'home/tabs/scan/scan.dart';
import 'home/tabs/settings/setting_change_password.dart';
import 'home/tabs/settings/setting_screen.dart';
import 'home/tabs/settings/theme/theme_screen.dart';
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
  late AppConfigProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppConfigProvider>(context);
    initSharedPref();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: LoginScreen.routeName,
      routes: {
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

  Future<void> initSharedPref() async {
    final prefs = await SharedPreferences.getInstance();
    var isDark = prefs.getBool('isDark');
    if (isDark == true) {
      provider.changeMode(ThemeMode.dark);
    } else if (isDark == false) {
      provider.changeMode(ThemeMode.light);
    }
  }
}

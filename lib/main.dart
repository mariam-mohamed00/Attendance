import 'package:attendance/home/screens/tabs/qr_code_cubit.dart';
import 'package:attendance/home/screens/tabs/settings/change_password_cubit.dart';
import 'package:attendance/providers/app_config_provider.dart';
import 'package:attendance/services/auth.service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home/screens/HomeScreen.dart';
import 'home/screens/tabs/Profile.dart';
import 'home/screens/tabs/scan.dart';
import 'home/screens/tabs/settings/setting_change_password.dart';
import 'home/screens/tabs/settings/setting_screen.dart';
import 'home/screens/tabs/settings/theme_screen.dart';
import 'login/screens/forget_password/forget_change_password.dart';
import 'login/screens/forget_password/forget_code.dart';
import 'login/screens/forget_password/forget_pass.dart';
import 'login/screens/login/login_screen.dart';
import 'my_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Prevent screenshots
  FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => AppConfigProvider(),
      ),
      Provider(create: (_) => AuthService())
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppConfigProvider provider = Provider.of<AppConfigProvider>(context);
    initSharedPref(provider);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => QrCodeCubit(),
        ),
        BlocProvider(
          create: (context) => ChangePasswordCubit(),
        ),
      ],
      child: MaterialApp(
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
      ),
    );
  }

  Future<void> initSharedPref(AppConfigProvider provider) async {
    final prefs = await SharedPreferences.getInstance();
    var isDark = prefs.getBool('isDark');
    if (isDark == true) {
      provider.changeMode(ThemeMode.dark);
    } else if (isDark == false) {
      provider.changeMode(ThemeMode.light);
    }
  }
}

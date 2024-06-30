import 'package:attendance/core/providers/app_config_provider.dart';
import 'package:attendance/core/utils/my_theme.dart';
import 'package:attendance/features/home/presentation/manager/qr_code/qr_code_cubit.dart';
import 'package:attendance/features/home/presentation/views/setting/presentation/manager/setting_change_password/change_password_cubit.dart';
import 'package:attendance/features/home/presentation/views/setting/presentation/manager/setting_log_out/logout_cubit.dart';
import 'package:attendance/features/login/data/auth.service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/forget_password/presentation/views/forget_change_password_screen.dart';
import 'features/forget_password/presentation/views/forget_code_screen.dart';
import 'features/forget_password/presentation/views/forget_pass_screen.dart';
import 'features/home/presentation/views/home_screen.dart';
import 'features/home/presentation/views/profile_screen.dart';
import 'features/home/presentation/views/scan_screen.dart';
import 'features/home/presentation/views/setting/presentation/views/setting_change_password_screen.dart';
import 'features/home/presentation/views/setting/presentation/views/setting_screen.dart';
import 'features/home/presentation/views/setting/presentation/views/theme_screen.dart';
import 'features/login/presentation/views/login_screen.dart';

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
        BlocProvider(
          create: (context) => LogoutCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: LoginScreen.routeName,
        routes: {
          LoginScreen.routeName: (context) => LoginScreen(),
          HomeScreen.routeName: (context) => HomeScreen(),
          ForgetPasswordScreen.routeName: (context) => ForgetPasswordScreen(),
          ForgetCodeScreen.routeName: (context) => ForgetCodeScreen(),
          ForgetChangePasswordScreen.routeName: (context) =>
              ForgetChangePasswordScreen(),
          ScanScreen.routeName: (context) => ScanScreen(),
          SettingChangePasswordScreen.routeName: (context) =>
              SettingChangePasswordScreen(),
          ProfileScreen.routeName: (context) => ProfileScreen(),
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
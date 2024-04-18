import 'package:attendance/home/screens/tabs/settings/setting_change_password.dart';
import 'package:attendance/home/screens/tabs/settings/theme_screen.dart';
import 'package:attendance/home/widgets/setting_items.dart';
import 'package:attendance/login/screens/login/login_screen.dart';
import 'package:attendance/providers/app_config_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatefulWidget {
  static const String routeName = 'Setting Screen';

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(children: [
              SettingItems(
                text: 'Change Password',
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(SettingChangePassword.routeName);
                },
                icon: Icons.privacy_tip,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              SettingItems(
                text: 'Theme',
                onTap: () {
                  Navigator.of(context).pushNamed(ThemeScreen.routeName);
                },
                icon: provider.appTheme == ThemeMode.dark
                    ? Icons.dark_mode
                    : Icons.light_mode,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              SettingItems(
                text: 'Log out',
                onTap: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      LoginScreen.routeName, (route) => false);
                },
                icon: Icons.logout_rounded,
              )
            ])));
  }
}

import 'package:attendance/home/tabs/settings/theme/theme_screen.dart';
import 'package:attendance/login/login_screen.dart';
import 'package:attendance/providers/app_config_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../my_theme.dart';
import 'setting_change_password.dart';

class SettingScreen extends StatelessWidget {
  static const String routeName = 'Setting Screen';

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {
                Navigator.of(context)
                    .pushNamed(SettingChangePassword.routeName);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.privacy_tip,
                      size: 35,
                      color: provider.appTheme == ThemeMode.light
                          ? MyTheme.blackColor
                          : MyTheme.whiteColor),
                  Text('Change Password',
                      style: Theme.of(context).textTheme.titleMedium),
                  Icon(Icons.arrow_forward_ios_sharp,
                      color: provider.appTheme == ThemeMode.light
                          ? MyTheme.blackColor
                          : MyTheme.whiteColor)
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {
                Navigator.of(context).pushNamed(ThemeScreen.routeName);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/images/theme.png',
                    width: 40,
                    height: 40,
                    color: provider.appTheme == ThemeMode.light
                        ? MyTheme.blackColor
                        : MyTheme.whiteColor,
                  ),
                  Text('Theme', style: Theme.of(context).textTheme.titleMedium),
                  Icon(Icons.arrow_forward_ios_sharp,
                      color: provider.appTheme == ThemeMode.light
                          ? MyTheme.blackColor
                          : MyTheme.whiteColor)
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    LoginScreen.routeName, (route) => false);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.logout_rounded,
                      size: 35,
                      color: provider.appTheme == ThemeMode.light
                          ? MyTheme.blackColor
                          : MyTheme.whiteColor),
                  Text('Log out',
                      style: Theme.of(context).textTheme.titleMedium),
                  Icon(Icons.arrow_forward_ios_sharp,
                      color: provider.appTheme == ThemeMode.light
                          ? MyTheme.blackColor
                          : MyTheme.whiteColor)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

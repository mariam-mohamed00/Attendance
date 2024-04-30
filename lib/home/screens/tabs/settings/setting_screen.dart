import 'package:attendance/home/screens/tabs/settings/logout_cubit.dart';
import 'package:attendance/home/screens/tabs/settings/setting_change_password.dart';
import 'package:attendance/home/screens/tabs/settings/theme_screen.dart';
import 'package:attendance/home/widgets/setting_items.dart';
import 'package:attendance/login/screens/login/login_screen.dart';
import 'package:attendance/providers/app_config_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../my_theme.dart';

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
              BlocListener<LogoutCubit, LogoutState>(
                listener: (context, state) {
                  if (state is Logoutsuccess) {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                        (route) => false);
                  }
                  if (state is LogoutFailed) {
                    AlertDialog(
                      backgroundColor: provider.appTheme == ThemeMode.light
                          ? MyTheme.whiteColor
                          : MyTheme.primaryDark,
                      title: Text(
                        " logout Failed",
                        style: Theme.of(context).textTheme.subtitle2!.copyWith(
                            color: provider.appTheme == ThemeMode.light
                                ? MyTheme.primaryLight
                                : MyTheme.whiteColor,
                            fontWeight: FontWeight.bold),
                      ),
                      icon: Icon(Icons.sms_failed, color: Colors.red, size: 45),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                      content: Text(
                        '${state.failed}',
                        style: Theme.of(context).textTheme.subtitle2!.copyWith(
                            color: provider.appTheme == ThemeMode.light
                                ? MyTheme.blackColor
                                : MyTheme.primaryLight),
                      ),
                    );
                  }
                },
                child: SettingItems(
                  text: 'Log out',
                  onTap: () {
                    (context).read<LogoutCubit>().logout();
                  },
                  icon: Icons.logout_rounded,
                ),
              )
            ])));
  }
}

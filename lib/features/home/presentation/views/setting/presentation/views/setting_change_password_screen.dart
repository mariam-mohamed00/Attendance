import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../../../../../../core/providers/app_config_provider.dart';
import '../../../../../../../core/utils/my_theme.dart';
import 'widgets/setting_form_change_password.dart';

class SettingChangePasswordScreen extends StatefulWidget {
  static const String routeName = 'Setting Change Password';

  @override
  State<SettingChangePasswordScreen> createState() =>
      _SettingChangePasswordScreenState();
}

class _SettingChangePasswordScreenState
    extends State<SettingChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Scaffold(
      backgroundColor: provider.appTheme == ThemeMode.light
          ? MyTheme.whiteColor
          : MyTheme.primaryDark,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
            color: provider.appTheme == ThemeMode.light
                ? MyTheme.blackColor
                : MyTheme.whiteColor,
            size: 35),
        toolbarHeight: 80,
        actions: [
          Lottie.asset('assets/images/animation/change_password.json',
              width: 90, fit: BoxFit.fill),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.height * 0.02,
              right: MediaQuery.of(context).size.height * 0.02),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 26),
              child: Text('Change your password',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.bold)),
            ),
            Text(
                'Your new password must be different from previously used password.',
                style: Theme.of(context).textTheme.titleSmall
                ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
            ),
                FormChangePassword()
          ]),
        ),
      ),
    );
  }
}

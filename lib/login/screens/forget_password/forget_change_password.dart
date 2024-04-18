import 'package:attendance/login/screens/forget_password/widgets/form_forget_change_password.dart';
import 'package:attendance/login/screens/forget_password/widgets/shadow_forget_screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../my_theme.dart';
import '../../../providers/app_config_provider.dart';

class ForgetChangePassword extends StatelessWidget {
  static const String routeName = 'Change Password';

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Scaffold(
      backgroundColor: provider.appTheme == ThemeMode.light
          ? MyTheme.whiteColor
          : MyTheme.primaryDark,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.height * 0.02,
            right: MediaQuery.of(context).size.height * 0.02,
            top: MediaQuery.of(context).size.height * 0.1,
          ),
          child:
          Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            ShadowForgetScreens(
              imageName: 'assets/images/pass.png',
              width: double.infinity,
              height: 150,
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.06,
                bottom: MediaQuery.of(context).size.height * 0.03,
              ),
              child: Text('Forget Password',
                  style: Theme.of(context).textTheme.titleMedium),
            ),
            Text('Please, enter your new password.',
                style: Theme.of(context).textTheme.titleSmall),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
            ),
            const FormForgetChangePassword(),
          ]),
        ),
      ),
    );
  }
}

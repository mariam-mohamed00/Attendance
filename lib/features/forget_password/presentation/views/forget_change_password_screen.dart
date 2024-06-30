import 'package:attendance/features/forget_password/presentation/views/widgets/form_forget_change_password.dart';
import 'package:attendance/features/forget_password/presentation/views/widgets/image_shadow.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/providers/app_config_provider.dart';
import '../../../../core/utils/my_theme.dart';

class ForgetChangePasswordScreen extends StatelessWidget {
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
            ImageShadow(
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

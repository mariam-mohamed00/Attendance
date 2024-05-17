import 'package:attendance/features/forget_password/presentation/views/widgets/form_forget_pass.dart';
import 'package:attendance/features/forget_password/presentation/views/widgets/image_shadow.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/providers/app_config_provider.dart';
import '../../../../core/utils/my_theme.dart';

class ForgetPasswordScreen extends StatelessWidget {
  static const String routeName = 'Forget Password';

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
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.height * 0.02,
            right: MediaQuery.of(context).size.height * 0.02,
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                ImageShadow(
                imageName: 'assets/images/lock.png',
                width: double.infinity,
                height: 200),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.05,
                bottom: MediaQuery.of(context).size.height * 0.03,
              ),
              child: Text('Forget Password',
                  style: Theme.of(context).textTheme.titleMedium),
            ),
            Text(
                'Please, enter your e-mail address to request a password reset for your account.',
                style: Theme.of(context).textTheme.titleSmall),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text('E-mail',
                  style: Theme.of(context).textTheme.titleMedium),
            ),
            FormForgetPass(),
          ]),
        ),
      ),
    );
  }
}

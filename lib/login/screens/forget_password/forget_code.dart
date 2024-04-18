import 'package:attendance/login/screens/forget_password/widgets/confirmation_code.dart';
import 'package:attendance/login/screens/forget_password/widgets/shadow_forget_screens.dart';
import 'package:attendance/login/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../my_theme.dart';
import '../../../providers/app_config_provider.dart';
import 'forget_change_password.dart';

class ForgetCode extends StatelessWidget {
  static const String routeName = 'Code for password';

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
              right: MediaQuery.of(context).size.height * 0.02),
          child:
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            ShadowForgetScreens(
              imageName: 'assets/images/confirm_logo.png',
              width: 260,
              height: 200,
              boxFit: BoxFit.fill,
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.05,
                bottom: MediaQuery.of(context).size.height * 0.03,
              ),
              child: Text('Forget Password',
                  style: Theme.of(context).textTheme.titleMedium),
            ),
            Text(
                'Please enter the 4 digit code that sent to your email address.',
                style: Theme.of(context).textTheme.titleSmall),
            ConfirmationCode(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            InkWell(
              onTap: () {},
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Text("if you don't receive code! resend.",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: MyTheme.primaryLight, fontSize: 16)),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            CustomButton(
              buttonText: 'Next',
              onPressed: () {
                Navigator.of(context).pushNamed(ForgetChangePassword.routeName);
              },
            ),
          ]),
        ),
      ),
    );
  }
}

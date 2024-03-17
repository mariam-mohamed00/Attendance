import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_shadow/simple_shadow.dart';

import '../../home/HomeScreen.dart';
import '../../my_theme.dart';
import '../../providers/app_config_provider.dart';
import '../custom_text_form_field.dart';

class ForgetChangePassword extends StatelessWidget {
  static const String routeName = 'Change Password';
  var formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

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
            SimpleShadow(
              opacity: 0.25,
              color: MyTheme.primaryLight,
              offset: const Offset(26, 10),
              sigma: 3,
              child: Image(
                width: double.infinity,
                height: 150,
                color: MyTheme.primaryLight,
                image: const AssetImage('assets/images/pass.png'),
              ), // Default: 2
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
            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text('New Password',
                        style: Theme.of(context).textTheme.titleMedium),
                  ),
                  CustomTextFormField(
                    isPassword: true,
                    hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: provider.appTheme == ThemeMode.light
                              ? MyTheme.blackColor.withOpacity(0.5)
                              : MyTheme.whiteColor.withOpacity(0.5),
                        ),
                    hint: '******',
                    keyboardType: TextInputType.number,
                    controller: passwordController,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return 'Please enter a new password';
                      }
                      if (text.length < 6) {
                        return 'please enter at least 6 characters';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text('Confirm Password',
                        style: Theme.of(context).textTheme.titleMedium),
                  ),
                  CustomTextFormField(
                    isPassword: true,
                    hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: provider.appTheme == ThemeMode.light
                              ? MyTheme.blackColor.withOpacity(0.5)
                              : MyTheme.whiteColor.withOpacity(0.5),
                        ),
                    hint: '******',
                    keyboardType: TextInputType.number,
                    controller: confirmPasswordController,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return 'Please enter your confirm password';
                      }
                      if (confirmPasswordController.text !=
                          passwordController.text) {
                        return 'Password mismatch';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        check(context);
                      },
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 80),
                          backgroundColor: MyTheme.primaryLight,
                          shape: const StadiumBorder()),
                      child: Text('Finish',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: MyTheme.whiteColor)),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }

  void check(BuildContext context) {
    if (formKey.currentState!.validate() == true) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(HomeScreen.routeName, (route) => false);
    }
  }
}

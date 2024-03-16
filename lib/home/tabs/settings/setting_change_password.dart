import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../../login/custom_text_form_field.dart';
import '../../../my_theme.dart';
import '../../../providers/app_config_provider.dart';
import '../../HomeScreen.dart';

class SettingChangePassword extends StatefulWidget {
  static const String routeName = 'Setting Change Password';

  @override
  State<SettingChangePassword> createState() => _SettingChangePasswordState();
}

class _SettingChangePasswordState extends State<SettingChangePassword>
    with SingleTickerProviderStateMixin {
  var formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();

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
              padding: EdgeInsets.only(bottom: 26),
              child: Text('Change your password',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.bold)),
            ),
            Text(
                'Your new password must be different from previously used password.',
                style: Theme.of(context).textTheme.titleSmall
                // !.copyWith(fontSize: 20)
                ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
            ),
            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 8),
                    child: Text('Current Password',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontSize: 20)),
                  ),
                  CustomTextFormField(
                    isPassword: true,
                    hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: provider.appTheme == ThemeMode.light
                              ? MyTheme.blackColor.withOpacity(0.5)
                              : MyTheme.whiteColor.withOpacity(0.5),
                        ),
                    hint: 'your password',
                    keyboardType: TextInputType.number,
                    controller: passwordController,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return 'Enter your current password';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 8),
                    child: Text('New Password',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontSize: 20)),
                  ),
                  CustomTextFormField(
                    hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: provider.appTheme == ThemeMode.light
                              ? MyTheme.blackColor.withOpacity(0.5)
                              : MyTheme.whiteColor.withOpacity(0.5),
                        ),
                    hint: '******',
                    keyboardType: TextInputType.number,
                    isPassword: true,
                    controller: newPasswordController,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return 'Enter new password to change';
                      }
                      if (text.length < 6) {
                        return 'At least 6 characters to change the password';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 8),
                    child: Text('Confirm Password',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontSize: 20)),
                  ),
                  CustomTextFormField(
                    hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: provider.appTheme == ThemeMode.light
                              ? MyTheme.blackColor.withOpacity(0.5)
                              : MyTheme.whiteColor.withOpacity(0.5),
                        ),
                    hint: '******',
                    keyboardType: TextInputType.number,
                    isPassword: true,
                    controller: confirmNewPasswordController,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return 'Please enter your password again';
                      }
                      if (confirmNewPasswordController.text !=
                          newPasswordController.text) {
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
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: MyTheme.whiteColor,
                                  )),
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

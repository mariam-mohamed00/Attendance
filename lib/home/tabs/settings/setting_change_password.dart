import 'package:flutter/material.dart';
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

class _SettingChangePasswordState extends State<SettingChangePassword> {
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
        elevation: 0.0,
        toolbarHeight: 70,
        title: const Text(
          "Change Password",
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(29),
                  bottomRight: Radius.circular(29)),
              gradient: LinearGradient(
                  colors: [Colors.indigo, Colors.blue],
                  begin: Alignment.center,
                  end: Alignment.bottomCenter)),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.height * 0.02,
              top: MediaQuery.of(context).size.height * 0.02,
              right: MediaQuery.of(context).size.height * 0.02),
          child: Column(children: [
            Text(
                'You’ll be logged out of all sessions except this one to protect your account if anyone is trying to gain access.',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: provider.appTheme == ThemeMode.light
                        ? MyTheme.blackColor
                        : MyTheme.whiteColor,
                    fontFamily: 'Montserrat',
                    fontSize: 14,
                    fontWeight: FontWeight.w700)),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
            ),
            Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Current Password',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                            color: provider.appTheme == ThemeMode.light
                                    ? MyTheme.blackColor
                                    : MyTheme.whiteColor,
                                fontFamily: 'Montserrat',
                                fontSize: 17,
                                fontWeight: FontWeight.w600)),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: CustomTextFormField(
                        isPassword: true,
                        hintStyle: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                fontFamily: 'Cambo',
                                color: provider.appTheme == ThemeMode.light
                                    ? MyTheme.greyTextColor
                                    : MyTheme.lightgreyColor),
                        hint: 'Curent Password',
                        keyboardType: TextInputType.number,
                        controller: passwordController,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'Enter your current password';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Text('New Password',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                            color: provider.appTheme == ThemeMode.light
                                    ? MyTheme.blackColor
                                    : MyTheme.whiteColor,
                                fontFamily: 'Montserrat',
                                fontSize: 17,
                                fontWeight: FontWeight.w600)),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: CustomTextFormField(
                        hintStyle: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                fontFamily: 'Cambo',
                                color: provider.appTheme == ThemeMode.light
                                    ? MyTheme.greyTextColor
                                    : MyTheme.lightgreyColor),
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
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Text('Confirm Password',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                            color: provider.appTheme == ThemeMode.light
                                    ? MyTheme.blackColor
                                    : MyTheme.whiteColor,
                                fontFamily: 'Montserrat',
                                fontSize: 17,
                                fontWeight: FontWeight.w600)),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: CustomTextFormField(
                        hintStyle: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                fontFamily: 'Cambo',
                                color: provider.appTheme == ThemeMode.light
                                    ? MyTheme.greyTextColor
                                    : MyTheme.lightgreyColor),
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
                            style: TextStyle(
                                fontSize: 18,
                                color: MyTheme.whiteColor,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w700)),
                      ),
                    ),
                  ],
                ),
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

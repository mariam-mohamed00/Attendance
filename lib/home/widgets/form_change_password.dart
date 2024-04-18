import 'package:attendance/login/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../login/widgets/custom_text_form_field.dart';
import '../../my_theme.dart';
import '../../providers/app_config_provider.dart';
import '../screens/HomeScreen.dart';

class FormChangePassword extends StatefulWidget {
  FormChangePassword({super.key});

  @override
  State<FormChangePassword> createState() => _FormChangePasswordState();
}

class _FormChangePasswordState extends State<FormChangePassword> {
  var formKey = GlobalKey<FormState>();

  TextEditingController passwordController = TextEditingController();

  TextEditingController newPasswordController = TextEditingController();

  TextEditingController confirmNewPasswordController = TextEditingController();

  bool isObscure1 = true;
  bool isObscure2 = true;
  bool isObscure3 = true;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
            child: Text('Current Password',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontSize: 20)),
          ),
          CustomTextFormField(
            isObscure: isObscure1,
            hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: provider.appTheme == ThemeMode.light
                      ? MyTheme.blackColor.withOpacity(0.5)
                      : MyTheme.whiteColor.withOpacity(0.5),
                ),
            hint: 'your password',
            suffixIcon: InkWell(
              child: isObscure1
                  ? Icon(Icons.visibility_off,
                      color: provider.appTheme == ThemeMode.light
                          ? MyTheme.blackColor
                          : MyTheme.whiteColor)
                  : Icon(Icons.visibility,
                      color: provider.appTheme == ThemeMode.light
                          ? MyTheme.blackColor
                          : MyTheme.whiteColor),
              onTap: () {
                if (isObscure1) {
                  isObscure1 = false;
                } else {
                  isObscure1 = true;
                }
                setState(() {});
              },
            ),
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
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
            child: Text('New Password',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontSize: 20)),
          ),
          CustomTextFormField(
            isObscure: isObscure2,
            hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: provider.appTheme == ThemeMode.light
                      ? MyTheme.blackColor.withOpacity(0.5)
                      : MyTheme.whiteColor.withOpacity(0.5),
                ),
            hint: '******',
            keyboardType: TextInputType.number,
            suffixIcon: InkWell(
              child: isObscure2
                  ? Icon(Icons.visibility_off,
                      color: provider.appTheme == ThemeMode.light
                          ? MyTheme.blackColor
                          : MyTheme.whiteColor)
                  : Icon(Icons.visibility,
                      color: provider.appTheme == ThemeMode.light
                          ? MyTheme.blackColor
                          : MyTheme.whiteColor),
              onTap: () {
                if (isObscure2) {
                  isObscure2 = false;
                } else {
                  isObscure2 = true;
                }
                setState(() {});
              },
            ),
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
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
            child: Text('Confirm Password',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontSize: 20)),
          ),
          CustomTextFormField(
            isObscure: isObscure3,
            hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: provider.appTheme == ThemeMode.light
                      ? MyTheme.blackColor.withOpacity(0.5)
                      : MyTheme.whiteColor.withOpacity(0.5),
                ),
            hint: '******',
            keyboardType: TextInputType.number,
            suffixIcon: InkWell(
              child: isObscure3
                  ? Icon(Icons.visibility_off,
                      color: provider.appTheme == ThemeMode.light
                          ? MyTheme.blackColor
                          : MyTheme.whiteColor)
                  : Icon(Icons.visibility,
                      color: provider.appTheme == ThemeMode.light
                          ? MyTheme.blackColor
                          : MyTheme.whiteColor),
              onTap: () {
                if (isObscure3) {
                  isObscure3 = false;
                } else {
                  isObscure3 = true;
                }
                setState(() {});
              },
            ),
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
          CustomButton(buttonText: 'Finish', onPressed: () => check())
        ],
      ),
    );
  }

  void check() {
    if (formKey.currentState!.validate() == true) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(HomeScreen.routeName, (route) => false);
    }
  }
}

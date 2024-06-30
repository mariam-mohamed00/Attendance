import 'package:attendance/core/widgets/custom_button.dart';
import 'package:attendance/features/forget_password/data/api_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/providers/app_config_provider.dart';
import '../../../../../core/utils/my_theme.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

class FormForgetChangePassword extends StatefulWidget {
  const FormForgetChangePassword({super.key});

  @override
  State<FormForgetChangePassword> createState() =>
      _FormForgetChangePasswordState();
}

class _FormForgetChangePasswordState extends State<FormForgetChangePassword> {
  var formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isObscure1 = true;
  bool isObscure2 = true;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Form(
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
            hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: provider.appTheme == ThemeMode.light
                      ? MyTheme.blackColor.withOpacity(0.5)
                      : MyTheme.whiteColor.withOpacity(0.5),
                ),
            hint: '******',
            isObscure: isObscure1,
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
            isObscure: isObscure2,
            hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: provider.appTheme == ThemeMode.light
                      ? MyTheme.blackColor.withOpacity(0.5)
                      : MyTheme.whiteColor.withOpacity(0.5),
                ),
            hint: '******',
            keyboardType: TextInputType.number,
            controller: confirmPasswordController,
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
            validator: (text) {
              if (text == null || text.trim().isEmpty) {
                return 'Please enter your confirm password';
              }
              if (confirmPasswordController.text != passwordController.text) {
                return 'Password mismatch';
              }
              return null;
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          CustomButton(
              buttonText: 'Finish',
              onPressed: () {
                check();
              })
        ],
      ),
    );
  }

  void check() {
    if (formKey.currentState!.validate() == true) {
      ApiManager.forgetChangePassword(
          context: context,
          password: passwordController.text,
          passwordConfirm: confirmPasswordController.text);
    }
  }
}

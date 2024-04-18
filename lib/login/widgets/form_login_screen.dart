import 'package:attendance/login/widgets/remeber_check.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../home/screens/HomeScreen.dart';
import '../../my_theme.dart';
import '../../providers/app_config_provider.dart';
import '../screens/forget_password/forget_pass.dart';
import 'custom_button.dart';
import 'custom_text_form_field.dart';

class FormLoginScreen extends StatefulWidget {
  FormLoginScreen({super.key});

  @override
  State<FormLoginScreen> createState() => _FormLoginScreenState();
}

class _FormLoginScreenState extends State<FormLoginScreen> {
  var formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child:
                Text('E-mail', style: Theme.of(context).textTheme.titleMedium),
          ),
          CustomTextFormField(
            hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: provider.appTheme == ThemeMode.light
                      ? MyTheme.blackColor.withOpacity(0.5)
                      : MyTheme.whiteColor.withOpacity(0.5),
                ),
            prefixIcon: Icon(
              Icons.person,
              color: provider.appTheme == ThemeMode.light
                  ? MyTheme.blackColor
                  : MyTheme.whiteColor,
            ),
            hint: 'example@email.com',
            keyboardType: TextInputType.emailAddress,
            controller: emailController,
            validator: (text) {
              if (text == null || text.trim().isEmpty) {
                return 'Please enter an email';
              }
              bool emailValid = RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  .hasMatch(text);
              if (!emailValid) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text('Password',
                style: Theme.of(context).textTheme.titleMedium),
          ),
          CustomTextFormField(
            isObscure: isObscure,
            hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: provider.appTheme == ThemeMode.light
                      ? MyTheme.blackColor.withOpacity(0.5)
                      : MyTheme.whiteColor.withOpacity(0.5),
                ),
            prefixIcon: Icon(
              Icons.lock,
              color: provider.appTheme == ThemeMode.light
                  ? MyTheme.blackColor
                  : MyTheme.whiteColor,
            ),
            suffixIcon: suffixIcon(),
            hint: 'your password',
            keyboardType: TextInputType.number,
            controller: passwordController,
            validator: (text) {
              if (text == null || text.trim().isEmpty) {
                return 'Please enter a password';
              }
              if (text.length < 6) {
                return 'please enter at least 6 characters';
              }
              return null;
            },
          ),
          RememberCheck(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.06,
          ),
          CustomButton(
            buttonText: 'Sign In',
            onPressed: () {
              login();
            },
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed(ForgetPasswordScreen.routeName);
            },
            child: Column(
              children: [
                Text(
                  'Forget Password?',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: MyTheme.lightgreyColor, fontSize: 16),
                ),
                Divider(
                  color: provider.appTheme == ThemeMode.light
                      ? MyTheme.lightgreyColor
                      : MyTheme.lightgreyColor,
                  thickness: 1,
                  height: 0,
                  indent: MediaQuery.of(context).size.width * 0.28,
                  endIndent: MediaQuery.of(context).size.height * 0.13,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void login() {
    if (formKey.currentState!.validate() == true) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(HomeScreen.routeName, (route) => false);
    }
  }

  InkWell suffixIcon() {
    var provider = Provider.of<AppConfigProvider>(context);

    return InkWell(
      child: isObscure
          ? Icon(Icons.visibility_off,
              color: provider.appTheme == ThemeMode.light
                  ? MyTheme.blackColor
                  : MyTheme.whiteColor)
          : Icon(Icons.visibility,
              color: provider.appTheme == ThemeMode.light
                  ? MyTheme.blackColor
                  : MyTheme.whiteColor),
      onTap: () {
        if (isObscure) {
          isObscure = false;
        } else {
          isObscure = true;
        }
        setState(() {});
      },
    );
  }
}

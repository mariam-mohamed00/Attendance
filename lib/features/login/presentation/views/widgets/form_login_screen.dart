import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/providers/app_config_provider.dart';
import '../../../../../core/utils/my_theme.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../forget_password/presentation/views/forget_pass_screen.dart';
import '../../../../home/presentation/views/home_screen.dart';
import '../../../data/auth.service.dart';

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

  var authService = AuthService();

  late AppConfigProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppConfigProvider>(context);

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
                      .copyWith(color: MyTheme.lightGreyColor, fontSize: 16),
                ),
                Divider(
                  color: provider.appTheme == ThemeMode.light
                      ? MyTheme.lightGreyColor
                      : MyTheme.lightGreyColor,
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

  void login() async {
    try {
      if (formKey.currentState!.validate() == true) {
        await authService.login(emailController.text, passwordController.text);
        Navigator.of(context)
            .pushNamedAndRemoveUntil(HomeScreen.routeName, (route) => false);
      }
    } catch (e) {
      var snackBar = SnackBar(
          backgroundColor: provider.appTheme == ThemeMode.dark
              ? MyTheme.whiteColor
              : MyTheme.blackColor,
          content: Text(
            e.toString(),
            style: TextStyle(color: Colors.red),
          ));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
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

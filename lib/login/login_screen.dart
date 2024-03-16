import 'package:attendance/home/HomeScreen.dart';
import 'package:attendance/providers/app_config_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../my_theme.dart';
import 'custom_text_form_field.dart';
import 'forget_password/forget_pass.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Stack(fit: StackFit.expand, children: [
        Image.asset(
          fit: BoxFit.fill,
          provider.appTheme == ThemeMode.light
              ? 'assets/images/background_light.png'
              : 'assets/images/background_dark.png',
        ),
        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.height * 0.02,
              right: MediaQuery.of(context).size.height * 0.02,
            ),
            child: Column(children: [
              Center(
                  child: Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.2,
                ),
                child: Text('Log In',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: 40)),
              )),
              // Divider(
              //   color: provider.appTheme == ThemeMode.light
              //       ? MyTheme.blackColor
              //       : MyTheme.whiteColor,
              //   thickness: 4,
              //   height: 0,
              //   indent: MediaQuery.of(context).size.width * 0.3,
              //   endIndent: MediaQuery.of(context).size.height * 0.135,
              // ),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text('E-mail',
                          style: Theme.of(context).textTheme.titleMedium),
                    ),
                    CustomTextFormField(
                      hintStyle:
                          Theme.of(context).textTheme.titleSmall!.copyWith(
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
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text('Password',
                          style: Theme.of(context).textTheme.titleMedium),
                    ),
                    CustomTextFormField(
                      hintStyle:
                          Theme.of(context).textTheme.titleSmall!.copyWith(
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
                      isPassword: true,
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
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          login();
                        },
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 80),
                            backgroundColor: MyTheme.primaryLight,
                            shape: const StadiumBorder()),
                        child: Text('Sign in',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: MyTheme.whiteColor,
                                )),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(ForgetPasswordScreen.routeName);
                      },
                      child: Column(
                        children: [
                          Text(
                            'Forget Password?',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(color: MyTheme.lightgreyColor),
                          ),
                          Divider(
                            color: provider.appTheme == ThemeMode.light
                                ? MyTheme.lightgreyColor
                                : MyTheme.lightgreyColor,
                            thickness: 1,
                            height: 0,
                            indent: MediaQuery.of(context).size.width * 0.28,
                            endIndent:
                                MediaQuery.of(context).size.height * 0.13,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ]),
    );
  }

  void login() {
    if (formKey.currentState!.validate() == true) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(HomeScreen.routeName, (route) => false);
    }
  }
}

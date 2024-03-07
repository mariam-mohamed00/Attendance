import 'package:attendance/home/HomeScreen.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Center(
              child: Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.13),
            child: Text('Log In',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontFamily: 'Inika')),
          )),
          Divider(
            color: MyTheme.blackColor,
            thickness: 4,
            height: 0,
            indent: MediaQuery.of(context).size.width * 0.35,
            endIndent: MediaQuery.of(context).size.height * 0.156,
          ),
          Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                  child: CustomTextFormField(
                    prefixIcon: Icon(
                      Icons.person,
                      color: MyTheme.blackColor,
                    ),
                    label: 'Email',
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
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                  child: CustomTextFormField(
                    prefixIcon: Icon(Icons.lock, color: MyTheme.blackColor),
                    isPassword: true,
                    label: 'Password',
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
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                ),
                Padding(
                  padding: const EdgeInsets.all(1.0),
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
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: MyTheme.whiteColor,
                          fontFamily: 'Montserrat',
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
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: MyTheme.greyTextColor,
                            fontWeight: FontWeight.w300,
                            fontFamily: 'Poppins'),
                      ),
                      Divider(
                        color: MyTheme.greyTextColor,
                        thickness: 1,
                        height: 0,
                        indent: MediaQuery.of(context).size.width * 0.33,
                        endIndent: MediaQuery.of(context).size.height * 0.156,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                ),
                Image.asset('assets/images/login_image.png')
              ],
            ),
          ),
        ]),
      ),
    );
  }

  void login() {
    if (formKey.currentState!.validate() == true) {
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    }
  }
}

import 'package:flutter/material.dart';

import '../../home/HomeScreen.dart';
import '../../my_theme.dart';
import '../custom_text_form_field.dart';

class ForgetChangePassword extends StatelessWidget {
  static const String routeName = 'Change Password';
  var formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.height * 0.02,
            right: MediaQuery.of(context).size.height * 0.02,
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.1,
                bottom: MediaQuery.of(context).size.height * 0.03,
              ),
              child: Text('Forget Password',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontFamily: 'Montserrat', fontSize: 24)),
            ),
            Text('Please, enter your new password.',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontFamily: 'Montserrat', fontSize: 14)),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('New Password',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
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
                              color: MyTheme.lightgreyColor),
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
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Text('Confirm Password',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
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
                              color: MyTheme.lightgreyColor),
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

import 'package:attendance/login/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_shadow/simple_shadow.dart';

import '../../my_theme.dart';
import '../../providers/app_config_provider.dart';
import 'forget_code.dart';

class ForgetPasswordScreen extends StatelessWidget {
  static const String routeName = 'Forget Password';
  var formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

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
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.height * 0.02,
            right: MediaQuery.of(context).size.height * 0.02,
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            SimpleShadow(
              opacity: 0.25,
              // Default: 0.5
              color: MyTheme.primaryLight,
              // Default: Black
              offset: const Offset(26, 10),
              // Default: Offset(2, 2)
              sigma: 3,
              child: Image(
                width: double.infinity,
                height: 200,
                color: MyTheme.primaryLight,
                image: const AssetImage('assets/images/lock.png'),
              ), // Default: 2
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.05,
                bottom: MediaQuery.of(context).size.height * 0.03,
              ),
              child: Text('Forget Password',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontFamily: 'Montserrat',
                      fontSize: 24,
                      color: provider.appTheme == ThemeMode.light
                          ? MyTheme.blackColor
                          : MyTheme.whiteColor)),
            ),
            Text(
                'Enter your E-mail to send a mail to re-assign a new password for your account.',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontFamily: 'Montserrat',
                    fontSize: 14,
                    color: provider.appTheme == ThemeMode.light
                        ? MyTheme.blackColor
                        : MyTheme.whiteColor)),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
            ),
            Text('E-mail',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: provider.appTheme == ThemeMode.light
                        ? MyTheme.blackColor
                        : MyTheme.whiteColor,
                    fontFamily: 'Montserrat',
                    fontSize: 17,
                    fontWeight: FontWeight.w600)),
            Form(
              key: formKey,
              child: Column(
                children: [
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
                      hint: 'lorem@gmail.com',
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'Please enter your email';
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
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      check(context);
                    },
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 80),
                        backgroundColor: MyTheme.primaryLight,
                        shape: const StadiumBorder()),
                    child: Text('Next',
                        style: TextStyle(
                            fontSize: 18,
                            color: MyTheme.whiteColor,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w700)),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  // Image.asset('assets/images/forget_password.png')
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
      Navigator.of(context).pushNamed(ForgetCode.routeName);
    }
  }
}

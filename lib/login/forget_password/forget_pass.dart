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
              color: MyTheme.primaryLight,
              offset: const Offset(26, 10),
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
                  style: Theme.of(context).textTheme.titleMedium),
            ),
            Text(
                'Please, enter your e-mail address to request a password reset for your account.',
                style: Theme.of(context).textTheme.titleSmall),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text('E-mail',
                  style: Theme.of(context).textTheme.titleMedium),
            ),
            Form(
              key: formKey,
              child: Column(children: [
                CustomTextFormField(
                  hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: provider.appTheme == ThemeMode.light
                            ? MyTheme.blackColor.withOpacity(0.5)
                            : MyTheme.whiteColor.withOpacity(0.5),
                      ),
                  hint: 'example@email.com',
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
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: Colors.white)))
              ]),
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

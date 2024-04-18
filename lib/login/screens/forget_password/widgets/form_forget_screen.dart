import 'package:attendance/login/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../my_theme.dart';
import '../../../../providers/app_config_provider.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../forget_code.dart';

class FormForgetScreen extends StatefulWidget {
  FormForgetScreen({super.key});

  @override
  State<FormForgetScreen> createState() => _FormForgetScreenState();
}

class _FormForgetScreenState extends State<FormForgetScreen> {
  var formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Form(
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
        CustomButton(
          buttonText: 'Next',
          onPressed: () {
            check();
          },
        )
      ]),
    );
  }

  void check() {
    if (formKey.currentState!.validate() == true) {
      Navigator.of(context).pushNamed(ForgetCode.routeName);
    }
  }
}

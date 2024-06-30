import 'package:attendance/core/widgets/custom_button.dart';
import 'package:attendance/features/forget_password/data/api_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/providers/app_config_provider.dart';
import '../../../../../core/utils/my_theme.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

class FormForgetPass extends StatefulWidget {
  FormForgetPass({super.key});

  @override
  State<FormForgetPass> createState() => _FormForgetPassState();
}

class _FormForgetPassState extends State<FormForgetPass> {
  var formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

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
      ApiManager.forgetPassword(context: context, email: emailController.text);
    }
  }
}

import 'package:attendance/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

import '../../../../home/screens/HomeScreen.dart';
import '../../../../providers/app_config_provider.dart';

class ConfirmationCode extends StatelessWidget {
  ConfirmationCode({super.key});

  TextEditingController pinCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Padding(
      padding: const EdgeInsets.only(left: 35, right: 35, top: 60),
      child: PinCodeTextField(
        appContext: context,
        textStyle: TextStyle(
            color: provider.appTheme == ThemeMode.light
                ? MyTheme.blackColor
                : MyTheme.whiteColor),
        length: 4,
        controller: pinCodeController,
        onChanged: (value) {
          // Handle pin code changes
        },
        onCompleted: (value) {
          // Handle pin code submitted

          if (pinCodeController.value == '1234') {
            Navigator.of(context).pushNamed(HomeScreen.routeName);
          } else {
            // Incorrect pin code
            print('Incorrect pin code');
          }
        },
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.underline,
          inactiveColor: MyTheme.lightgreyColor,
          activeColor: Colors.blue,
        ),
      ),
    );
  }
}

import 'package:attendance/core/utils/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

import '../../../../../core/providers/app_config_provider.dart';

class ConfirmationCode extends StatelessWidget {
  ConfirmationCode({required this.pinCodeController});

  TextEditingController pinCodeController;

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
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.underline,
          inactiveColor: MyTheme.lightGreyColor,
          activeColor: Colors.blue,
        ),
      ),
    );
  }
}

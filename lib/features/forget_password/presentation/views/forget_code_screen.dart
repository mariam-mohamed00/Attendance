import 'package:attendance/core/widgets/custom_button.dart';
import 'package:attendance/features/forget_password/data/api_manager.dart';
import 'package:attendance/features/forget_password/presentation/views/widgets/confirmation_code.dart';
import 'package:attendance/features/forget_password/presentation/views/widgets/image_shadow.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

import '../../../../core/providers/app_config_provider.dart';
import '../../../../core/utils/my_theme.dart';

class ForgetCodeScreen extends StatefulWidget {
  static const String routeName = 'Code for password';

  @override
  State<ForgetCodeScreen> createState() => _ForgetCodeScreenState();
}

class _ForgetCodeScreenState extends State<ForgetCodeScreen> {
  TextEditingController pinCodeController = TextEditingController();
  CountdownController timerController = CountdownController(autoStart: true);

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
              right: MediaQuery.of(context).size.height * 0.02),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            ImageShadow(
              imageName: 'assets/images/confirm_logo.png',
              width: 260,
              height: 200,
              boxFit: BoxFit.fill,
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
                'Please enter the 4 digit code that sent to your email address.',
                style: Theme.of(context).textTheme.titleSmall),
            ConfirmationCode(pinCodeController: pinCodeController),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Center(
              child: Countdown(
                controller: timerController,
                seconds: 2 * 60,
                build: (_, double time) => Text(
                    '${(time / 60).floor().toString().padLeft(2, '0')}:${(time % 60).floor().toString().padLeft(2, '0')}',
                    style: Theme.of(context).textTheme.titleSmall),
                interval: const Duration(seconds: 1),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            InkWell(
              onTap: () {
                ApiManager.resendConfirmCode(context: context)
                    .then((_) => timerController.restart());
              },
              child: Text("if you don't receive code! resend.",
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: MyTheme.primaryLight, fontSize: 16)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            CustomButton(
              buttonText: 'Next',
              onPressed: () {
                ApiManager.confirmationCode(
                    context: context,
                    confirmCode: int.parse(pinCodeController.text));
              },
            ),
          ]),
        ),
      ),
    );
  }
}

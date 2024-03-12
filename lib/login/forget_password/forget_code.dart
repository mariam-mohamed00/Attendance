import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_shadow/simple_shadow.dart';

import '../../my_theme.dart';
import '../../providers/app_config_provider.dart';
import 'forget_change_password.dart';

class ForgetCode extends StatelessWidget {
  static const String routeName = 'Code for password';
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
              right: MediaQuery.of(context).size.height * 0.02),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Center(
              child: SimpleShadow(
                opacity: 0.25,
                // Default: 0.5
                color: MyTheme.primaryLight,
                // Default: Black
                offset: const Offset(26, 10),
                // Default: Offset(2, 2)
                sigma: 3,
                child: Image(
                  width: 300,
                  height: 200,
                  fit: BoxFit.fill,
                  color: MyTheme.primaryLight,
                  image: const AssetImage('assets/images/confirm_logo.png'),
                ), // Default: 2
              ),
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
                'Type the OTP you received on your e-mail to continue resetting your password.',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontFamily: 'Montserrat',
                    fontSize: 14,
                    color: provider.appTheme == ThemeMode.light
                        ? MyTheme.blackColor
                        : MyTheme.whiteColor)),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: MyTheme.lightgreyColor,
                  ),
                ),
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: MyTheme.lightgreyColor,
                  ),
                ),
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: MyTheme.lightgreyColor,
                  ),
                ),
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: MyTheme.lightgreyColor,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            InkWell(
              onTap: () {},
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('Resend the mail again.',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontFamily: 'Montserrat',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: MyTheme.primaryLight)),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(ForgetChangePassword.routeName);
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
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            // Image.asset('assets/images/code_password.png'),
          ]),
        ),
      ),
    );
  }
}

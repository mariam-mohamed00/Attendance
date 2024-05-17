import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/providers/app_config_provider.dart';
import 'widgets/form_login_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Scaffold(
      body: Stack(fit: StackFit.expand, children: [
        Image.asset(
          fit: BoxFit.fill,
          provider.appTheme == ThemeMode.light
              ? 'assets/images/background_light.png'
              : 'assets/images/background_dark.png',
        ),
        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.height * 0.02,
              right: MediaQuery.of(context).size.height * 0.02,
            ),
            child: Column(children: [
              Center(
                  child: Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.2,
                ),
                child: Text('Log In',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: 40)),
              )),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              FormLoginScreen(),
            ]),
          ),
        ),
      ]),
    );
  }
}

import 'package:attendance/my_theme.dart';
import 'package:attendance/providers/app_config_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RememberCheck extends StatefulWidget {
  RememberCheck({super.key});

  @override
  State<RememberCheck> createState() => _RememberCheckState();
}

class _RememberCheckState extends State<RememberCheck> {
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return CheckboxListTile(
      checkColor: Colors.white,
      side: BorderSide(
        color: provider.appTheme == ThemeMode.dark
            ? MyTheme.whiteColor
            : MyTheme.blackColor,
        width: 1.5,
      ),
      value: _rememberMe,
      onChanged: (value) {
        if (value == null) return;
        setState(() {
          _rememberMe = value;
        });
      },
      title: Text(
        'Remember me',
        style: TextStyle(
            color: provider.appTheme == ThemeMode.dark
                ? MyTheme.whiteColor
                : MyTheme.blackColor),
      ),
      controlAffinity: ListTileControlAffinity.leading,
      dense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
    );
  }
}

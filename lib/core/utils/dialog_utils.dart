import 'package:attendance/core/providers/app_config_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'my_theme.dart';

class DialogUtils {
  static void showLoading(BuildContext context, String message) {
    var provider = Provider.of<AppConfigProvider>(context, listen: false);

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: provider.appTheme == ThemeMode.dark
              ? MyTheme.primaryDark
              : MyTheme.whiteColor,
          content: Row(
            children: [
              CircularProgressIndicator(),
              SizedBox(
                width: 12,
              ),
              Text(
                message,
                style: TextStyle(
                    color: provider.appTheme == ThemeMode.dark
                        ? MyTheme.whiteColor
                        : MyTheme.blackColor),
              ),
            ],
          ),
        );
      },
    );
  }

  static void hideLoading(BuildContext context) {
    Navigator.pop(context);
  }

  static void showMessage(BuildContext context, String message,
      {String title = 'Title',
      String? posActionName,
      VoidCallback? posAction,
      String? negActionName,
      VoidCallback? negAction,
      bool barrierDismissible = true}) {
    var provider = Provider.of<AppConfigProvider>(context, listen: false);

    List<Widget> actions = [];
    if (posActionName != null) {
      actions.add(TextButton(
          onPressed: () {
            posAction?.call();
          },
          child: Text(posActionName)));
    }
    if (negActionName != null) {
      actions.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            negAction?.call();
          },
          child: Text(negActionName)));
    }
    showDialog(
      barrierDismissible: barrierDismissible,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: provider.appTheme == ThemeMode.dark
              ? MyTheme.primaryDark
              : MyTheme.whiteColor,
          content: Text(
            message,
            style: TextStyle(
                color: provider.appTheme == ThemeMode.dark
                    ? MyTheme.whiteColor
                    : MyTheme.blackColor,
                fontWeight: FontWeight.w600,
                fontSize: 18),
          ),
          title: Text(title),
          actions: actions,
          titleTextStyle: TextStyle(
              color: provider.appTheme == ThemeMode.dark
                  ? MyTheme.whiteColor
                  : MyTheme.blackColor,
              fontSize: 22,
              fontWeight: FontWeight.bold),
        );
      },
    );
  }
}

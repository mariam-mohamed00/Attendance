import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../core/providers/app_config_provider.dart';
import '../../../../../../../../core/utils/my_theme.dart';

class SettingItems extends StatelessWidget {
  SettingItems({
    super.key,
    required this.text,
    this.icon,
    required this.onTap,
  });

  IconData? icon;
  VoidCallback onTap;
  String text;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(icon,
                size: 35,
                color: provider.appTheme == ThemeMode.light
                    ? MyTheme.blackColor
                    : MyTheme.whiteColor),
            Text(text, style: Theme.of(context).textTheme.titleMedium),
            Icon(Icons.arrow_forward_ios_sharp,
                color: provider.appTheme == ThemeMode.light
                    ? MyTheme.blackColor
                    : MyTheme.whiteColor)
          ],
        ));
  }
}

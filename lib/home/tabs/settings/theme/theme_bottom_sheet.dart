import 'package:attendance/my_theme.dart';
import 'package:attendance/providers/app_config_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      color: provider.appTheme == ThemeMode.light
          ? MyTheme.whiteColor
          : MyTheme.primaryDark,
      child: Column(
        children: [
          InkWell(
              onTap: () {
                provider.changeMode(ThemeMode.light);
              },
              child: provider.appTheme == ThemeMode.light
                  ? getSelectedItemWidget(context, 'Light')
                  : getUnSelectedItemWidget(context, 'Light')),
          InkWell(
              onTap: () {
                provider.changeMode(ThemeMode.dark);
              },
              child: provider.appTheme == ThemeMode.dark
                  ? getSelectedItemWidget(context, 'Dark')
                  : getUnSelectedItemWidget(context, 'Dark')),
        ],
      ),
    );
  }

  Widget getSelectedItemWidget(BuildContext context, String text) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: MyTheme.primaryLight, fontSize: 18),
          ),
          Icon(
            Icons.check,
            color: MyTheme.primaryLight,
            size: 25,
          ),
        ],
      ),
    );
  }

  Widget getUnSelectedItemWidget(BuildContext context, String text) {
    var provider = Provider.of<AppConfigProvider>(context, listen: false);

    return Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: 18,
                  color: provider.appTheme == ThemeMode.light
                      ? MyTheme.blackColor
                      : MyTheme.whiteColor)),
        ],
      ),
    );
  }
}

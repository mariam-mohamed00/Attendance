import 'package:attendance/home/tabs/settings/theme/theme_bottom_sheet.dart';
import 'package:attendance/my_theme.dart';
import 'package:attendance/providers/app_config_provider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class ThemeScreen extends StatefulWidget {
  static const String routeName = 'Theme Screen';

  @override
  State<ThemeScreen> createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Scaffold(
      backgroundColor: provider.appTheme == ThemeMode.light
          ? MyTheme.whiteColor
          : MyTheme.primaryDark,
      appBar: AppBar(
        toolbarHeight: 80,
        actions: [
          Container(
              child: Lottie.asset('assets/images/animation/theme.json',
                  width: 100, fit: BoxFit.fill)),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
            color: provider.appTheme == ThemeMode.light
                ? MyTheme.blackColor
                : MyTheme.whiteColor,
            size: 35),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('App Theme',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.bold)),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            InkWell(
              onTap: () {
                showThemeBottomSheet();
              },
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: MyTheme.whiteColor,
                  border: Border.all(
                    color: MyTheme.primaryLight,
                    width: 4,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        provider.appTheme == ThemeMode.light ? 'Light' : 'Dark',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: provider.appTheme == ThemeMode.light
                                ? MyTheme.blackColor
                                : MyTheme.primaryDark)),
                    Icon(Icons.arrow_drop_down),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(
        context: context, builder: (context) => ThemeBottomSheet());
  }
}

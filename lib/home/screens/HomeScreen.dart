import 'package:attendance/home/screens/tabs/Profile.dart';
import 'package:attendance/home/screens/tabs/scan.dart';
import 'package:attendance/home/screens/tabs/settings/setting_screen.dart';
import 'package:attendance/login/screens/login/login_screen.dart';
import 'package:attendance/providers/app_config_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../my_theme.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home Screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Scaffold(
      backgroundColor: provider.appTheme == ThemeMode.light
          ? MyTheme.whiteColor
          : MyTheme.primaryDark,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        toolbarHeight: 75,
        title: Text(
          "Attendance",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: MyTheme.whiteColor),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(29),
                  bottomRight: Radius.circular(29)),
              gradient: LinearGradient(
                  colors: [Colors.indigo, Colors.blue],
                  begin: Alignment.center,
                  end: Alignment.bottomCenter)),
        ),
        systemOverlayStyle: provider.appTheme == ThemeMode.light
            ? SystemUiOverlayStyle.light
            : SystemUiOverlayStyle.dark,
        actions: [
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(LoginScreen.routeName);
            },
            child: const Icon(Icons.logout, size: 25.0),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: tabs[selectedIndex],
      bottomNavigationBar: BottomAppBar(
        clipBehavior: Clip.antiAlias,
        shape: const CircularNotchedRectangle(),
        notchMargin: 12,
        child: BottomNavigationBar(
          selectedItemColor: MyTheme.whiteColor,
          unselectedItemColor: MyTheme.primaryDark,
          backgroundColor: MyTheme.primaryLight,
          selectedIconTheme: IconThemeData(size: 25, color: MyTheme.whiteColor),
          selectedLabelStyle:
              Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 20),
          unselectedIconTheme:
              IconThemeData(size: 20, color: MyTheme.primaryDark),
          unselectedLabelStyle:
              Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 16),
          currentIndex: selectedIndex,
          onTap: (index) {
            selectedIndex = index;
            setState(() {});
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        height: 70,
        width: 70,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed(Scan.routeName);
            setState(() {});
          },
          child: const Icon(
            Icons.qr_code_scanner_sharp,
            size: 50,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  List<Widget> tabs = [
    const Profile(),
    SettingScreen(),
  ];
}

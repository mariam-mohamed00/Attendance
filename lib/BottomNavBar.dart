import 'package:attendance/Profile.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'scan.dart';
import 'ChangePassword.dart';

class BottomNavBar extends StatefulWidget {
  static const String routeName = 'BottomNavBar';

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          toolbarHeight: 70,
          title: const Text(
            "Attendenc System",
            style: TextStyle(fontSize: 25),
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
          systemOverlayStyle: SystemUiOverlayStyle.light,
          actions: [
            InkWell(
              onTap: () {},
              child: const Icon(Icons.logout, size: 25.0),
            ),
            const SizedBox(
              width: 10,
            )
          ],
        ),
        body: tabs[selectedIndex],
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(0), topRight: Radius.circular(0)),
              gradient: LinearGradient(
                  colors: [Colors.indigo, Colors.lightBlue],
                  begin: Alignment.center,
                  end: Alignment.bottomRight)),
          child: BottomNavyBar(
            backgroundColor: Colors.transparent,
            selectedIndex: selectedIndex,
            showElevation: true,
            // use this to remove appBar's elevation
            onItemSelected: (index) => setState(() {
              selectedIndex = index;
            }),
            items: [
              BottomNavyBarItem(
                  icon: const Icon(
                    size: 30,
                    Icons.qr_code_scanner_sharp,
                  ),
                  title: const Text(
                    'Scan',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  activeColor: Colors.black26,
                  inactiveColor: Colors.white),
              BottomNavyBarItem(
                  icon: const Icon(
                    size: 30,
                    Icons.person,
                  ),
                  title: const Text(
                    'Profile',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  activeColor: Colors.black26,
                  inactiveColor: Colors.white),
              BottomNavyBarItem(
                  icon: const Icon(
                    size: 30,
                    Icons.settings_suggest_sharp,
                  ),
                  title: const Text(
                    'Setting',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  activeColor: Colors.black26,
                  inactiveColor: Colors.white),
            ],
          ),
        ));
  }

  List<Widget> tabs = [
    const Scan(),
    const ProfilePerson(),
    const Changepassword(),
  ];
}

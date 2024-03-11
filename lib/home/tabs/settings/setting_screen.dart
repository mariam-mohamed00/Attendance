import 'package:attendance/home/tabs/profile/Profile.dart';
import 'package:attendance/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'SettingChangePassword.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.privacy_tip, size: 35),
                Text('Change Password',
                    style: Theme.of(context).textTheme.titleMedium),
                InkWell(
                    onTap: () {
                      Navigator.of(context).pushReplacementNamed(
                          SettingChangePassword.routeName);
                    },
                    child: Icon(Icons.arrow_forward_ios_sharp))
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/theme.png',
                  width: 40,
                  height: 40,
                ),
                Text('Theme', style: Theme.of(context).textTheme.titleMedium),
                InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(ProfilePerson.routeName);
                    },
                    child: Icon(Icons.arrow_forward_ios_sharp))
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.logout_rounded, size: 35),
                Text('Log out', style: Theme.of(context).textTheme.titleMedium),
                InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          LoginScreen.routeName, (route) => false);
                    },
                    child: Icon(Icons.arrow_forward_ios_sharp))
              ],
            ),
          ],
        ),
      ),
    );
  }
}

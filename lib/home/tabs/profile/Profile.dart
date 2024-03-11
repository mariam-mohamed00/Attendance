import 'package:flutter/material.dart';

class ProfilePerson extends StatefulWidget {
  const ProfilePerson({Key? key}) : super(key: key);
  static const String routeName = 'Profile';

  @override
  State<ProfilePerson> createState() => _ProfilePersonState();
}

class _ProfilePersonState extends State<ProfilePerson> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
    );
  }
}

import 'dart:convert';

import 'package:attendance/home/widgets/custom_container_profile.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);
  static const String routeName = 'Profile';

  @override
  State<Profile> createState() => _SignInPage1State();
}

class _SignInPage1State extends State<Profile> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String name = "";
  String email = "";
  String role = "";
  List<String> courses = [];

  initState() {
    super.initState();
    _getCurrentUser();
  }

  _getCurrentUser() async {
    final prefs = await SharedPreferences.getInstance();
    var currentUser = prefs.getString('currentUser');
    if (currentUser != null) {
      setState(() {
        name = json.decode(currentUser)['name'];
        email = json.decode(currentUser)['email'];
        role = json.decode(currentUser)['role'];
        for (int i = 0; i < json.decode(currentUser)["courses"].length; i++) {
          courses.add(json.decode(currentUser)["courses"][i]["courseName"]);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Form(
        key: _formKey,
        child: Center(
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.01,
                vertical: MediaQuery.of(context).size.height * 0.01),
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.9),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Welcome , $name !",
                      style: Theme.of(context).textTheme.titleLarge),
                  _gap(),
                  _gap(),
                  CustomContainerInProfile(
                    fieldName: 'Name',
                    text: name,
                  ),
                  _gap(),
                  CustomContainerInProfile(
                    fieldName: 'Your Account',
                    text: email,
                  ),
                  _gap(),
                  CustomContainerInProfile(
                    fieldName: 'role',
                    text: role,
                  ),
                  _gap(),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: courses.length,
                    itemBuilder: (context, index) => CustomContainerInProfile(
                        text: courses[index], fieldName: "Course Name"),
                  ),
                  _gap(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _gap() => const SizedBox(height: 16);
}

import 'package:attendance/home/widgets/custom_container_profile.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);
  static const String routeName = 'Profile';

  @override
  State<Profile> createState() => _SignInPage1State();
}

class _SignInPage1State extends State<Profile> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                  Text("Welcome, name!",
                      style: Theme.of(context).textTheme.titleLarge),
                  _gap(),
                  _gap(),
                  CustomContainerInProfile(
                    fieldName: 'Name',
                    text: 'name',
                  ),
                  _gap(),
                  CustomContainerInProfile(
                    fieldName: 'Your Account',
                    text: 'account',
                  ),
                  _gap(),
                  CustomContainerInProfile(
                    fieldName: 'Department',
                    text: 'dept',
                  ),
                  _gap(),
                  CustomContainerInProfile(
                    fieldName: 'GPA',
                    text: 'gpa',
                  ),
                  _gap(),
                  CustomContainerInProfile(
                    fieldName: 'Subjects',
                    text: 'sub',
                  ),
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

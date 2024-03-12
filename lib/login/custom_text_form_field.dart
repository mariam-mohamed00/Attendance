import 'package:attendance/providers/app_config_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../my_theme.dart';

class CustomTextFormField extends StatelessWidget {
  String hint;
  TextStyle hintStyle;
  TextEditingController controller;
  TextInputType keyboardType;
  String? Function(String?)? validator;
  bool isPassword;
  Icon? prefixIcon;

  CustomTextFormField({required this.hint,
    required this.hintStyle,
    required this.keyboardType,
    required this.controller,
    required this.validator,
    this.prefixIcon,
    this.isPassword = false});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextFormField(
          style: TextStyle(
            color: provider.appTheme == ThemeMode.light
                ? MyTheme.blackColor
                : MyTheme.whiteColor,
          ),
          obscureText: isPassword,
          controller: controller,
          validator: validator,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            prefixIcon: prefixIcon,
            hintStyle: hintStyle,
            hintText: hint,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFF878787)),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFF878787)),
              borderRadius: BorderRadius.circular(15),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFF878787)),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFF878787)),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ));
  }
}

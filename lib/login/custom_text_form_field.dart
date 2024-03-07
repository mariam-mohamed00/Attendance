import 'package:flutter/material.dart';

import '../my_theme.dart';

class CustomTextFormField extends StatelessWidget {
  String label;
  TextEditingController controller;
  TextInputType keyboardType;
  String? Function(String?)? validator;
  bool isPassword;
  Icon prefixIcon;

  CustomTextFormField(
      {required this.label,
      required this.keyboardType,
      required this.controller,
      required this.validator,
      required this.prefixIcon,
      this.isPassword = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        obscureText: isPassword,
        controller: controller,
        validator: validator,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          filled: true,
          fillColor: MyTheme.backgroundGreyColor,
          label: Padding(
            padding: const EdgeInsets.only(left: 42.0),
            child: Text(label),
          ),
          labelStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: MyTheme.blackColor.withOpacity(0.5),
                fontFamily: 'Cambo',
              ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: MyTheme.backgroundGreyColor),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: MyTheme.backgroundGreyColor),
            borderRadius: BorderRadius.circular(15),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: MyTheme.backgroundGreyColor),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: MyTheme.backgroundGreyColor),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}

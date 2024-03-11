import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  String hint;
  TextStyle hintStyle;
  TextEditingController controller;
  TextInputType keyboardType;
  String? Function(String?)? validator;
  bool isPassword;
  Icon? prefixIcon;

  CustomTextFormField(
      {required this.hint,
      required this.hintStyle,
      required this.keyboardType,
      required this.controller,
      required this.validator,
      this.prefixIcon,
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
            // filled: true,
            // fillColor: MyTheme.backgroundGreyColor,
            hintStyle: hintStyle,
            hintText: hint,

            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFF878787)),
              borderRadius: BorderRadius.circular(20),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFF878787)),
              borderRadius: BorderRadius.circular(20),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFF878787)),
              borderRadius: BorderRadius.circular(20),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFF878787)),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        )
        // enabledBorder: OutlineInputBorder(
        //   borderSide: BorderSide(color: MyTheme.backgroundGreyColor),
        //   borderRadius: BorderRadius.circular(15),
        // ),
        // focusedBorder: OutlineInputBorder(
        //   borderSide: BorderSide(color: MyTheme.backgroundGreyColor),
        //   borderRadius: BorderRadius.circular(15),
        // ),
        // errorBorder: OutlineInputBorder(
        //   borderSide: BorderSide(color: MyTheme.backgroundGreyColor),
        //   borderRadius: BorderRadius.circular(15),
        // ),
        // focusedErrorBorder: OutlineInputBorder(
        //   borderSide: BorderSide(color: MyTheme.backgroundGreyColor),
        //   borderRadius: BorderRadius.circular(15),
        // ),
        // ),
        // ),
        );
  }
}

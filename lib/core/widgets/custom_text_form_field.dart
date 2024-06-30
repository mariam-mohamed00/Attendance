import 'package:attendance/core/providers/app_config_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/my_theme.dart';

class CustomTextFormField extends StatefulWidget {
  String hint;
  TextStyle hintStyle;
  TextEditingController controller;
  TextInputType keyboardType;
  String? Function(String?)? validator;
  Icon? prefixIcon;
  InkWell? suffixIcon;
  bool isObscure;

  CustomTextFormField(
      {required this.hint,
      required this.hintStyle,
      required this.keyboardType,
      required this.controller,
      required this.validator,
      this.prefixIcon,
      this.suffixIcon,
      this.isObscure = false});

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextFormField(
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: provider.appTheme == ThemeMode.light
                  ? MyTheme.blackColor
                  : MyTheme.whiteColor),
          controller: widget.controller,
          obscureText: widget.isObscure,
          validator: widget.validator,
          keyboardType: widget.keyboardType,
          decoration: InputDecoration(
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon,
            hintStyle: widget.hintStyle,
            hintText: widget.hint,
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

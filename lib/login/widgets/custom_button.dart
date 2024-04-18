import 'package:flutter/material.dart';

import '../../my_theme.dart';

class CustomButton extends StatelessWidget {
  CustomButton({super.key, required this.buttonText, required this.onPressed});

  String buttonText;
  VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 80),
            backgroundColor: MyTheme.primaryLight,
            shape: const StadiumBorder()),
        child: Text(buttonText,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: MyTheme.whiteColor,
                )),
      ),
    );
  }
}

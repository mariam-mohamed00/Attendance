import 'package:flutter/material.dart';

import '../../my_theme.dart';

class CustomContainerInProfile extends StatelessWidget {
  var text;
  String fieldName;

  CustomContainerInProfile({required this.text, required this.fieldName});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(fieldName, style: Theme.of(context).textTheme.titleMedium),
        Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: MyTheme.primaryLight),
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.only(top: 18, left: 16),
                child:
                    Text(text, style: Theme.of(context).textTheme.titleSmall),
              ),
            )),
      ],
    );
  }
}

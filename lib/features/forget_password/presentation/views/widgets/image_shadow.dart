import 'package:flutter/material.dart';
import 'package:simple_shadow/simple_shadow.dart';

import '../../../../../core/utils/my_theme.dart';

class ImageShadow extends StatelessWidget {
  ImageShadow(
      {super.key,
      required this.imageName,
      required this.height,
      required this.width,
      this.boxFit});

  String imageName;
  double height;
  double width;
  BoxFit? boxFit = BoxFit.none;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SimpleShadow(
        opacity: 0.25,
        color: MyTheme.primaryLight,
        offset: const Offset(26, 10),
        sigma: 3,
        child: Image(
          width: width,
          height: height,
          fit: boxFit,
          color: MyTheme.primaryLight,
          image: AssetImage(imageName),
        ), // Default: 2
      ),
    );
  }
}

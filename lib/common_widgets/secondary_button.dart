import 'package:flutter/material.dart';

import '../common/color_extension.dart';

class SecondaryButton extends StatelessWidget {
  final String title;
  final Function()? onTap;
  final double fontSize;
  final FontWeight fontWeight;

  const SecondaryButton({
    super.key,
    this.title = "Get Started",
    required this.onTap,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w600,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: TColor.gray80,
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: fontSize,
            color: TColor.white,
            fontWeight: fontWeight,

          ),
        ),
      ),
    );
  }
}
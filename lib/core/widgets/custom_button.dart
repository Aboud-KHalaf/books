// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import '../utils/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.backgroundColor,
    this.borderRadius,
    required this.text,
    required this.TextColor,
    required this.fontSize, this.onTap,
  });

  final Color backgroundColor;
  final Color TextColor;
  final double fontSize;
  final void Function()? onTap;

  final BorderRadius? borderRadius;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(16),
            )),
        onPressed: onTap,
        child: Text(
          text,
          style: Styles.textStyle18.copyWith(
            fontSize: fontSize,
            color: TextColor,
          ),
        ),
      ),
    );
  }
}

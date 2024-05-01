import 'package:book/constant.dart';
import 'package:book/core/utils/styles.dart';
import 'package:flutter/material.dart';

void showMessage(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: KSecondaryColor,
      content: Center(
        child: Text(
          "sorry ...This link is not available",
          style: Styles.textStyle16,
        ),
      ),
    ),
  );
}

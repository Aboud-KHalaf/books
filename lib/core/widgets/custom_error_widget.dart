import 'package:book/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.errText});

  final String errText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Lottie.asset("assets/anmations/error_1.json"),
        Text(
          errText,
          style: Styles.textStyle18,
        ),
      ],
    );
  }
}

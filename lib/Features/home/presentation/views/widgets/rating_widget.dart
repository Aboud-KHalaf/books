import 'dart:math';

import 'package:flutter/material.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.star,
          color: Colors.yellow,
          size: 20,
        ),
        const SizedBox(
          width: 4.6,
        ),
        Text("${Random().nextInt(4) + 1}.${Random().nextInt(9)}"),
        const SizedBox(width: 4.6),
        Text("(${Random().nextInt(999)})"),
      ],
    );
  }
}

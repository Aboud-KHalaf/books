
import 'package:flutter/material.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidingAnimation,
      builder: (context, _) {
        return SlideTransition(
          position: slidingAnimation,
          child: const Text(
            "world of free books",
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }
}

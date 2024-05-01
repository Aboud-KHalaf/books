import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnimationBox extends StatelessWidget {
  const AnimationBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(top: (height - 400) / 2),
      child: Center(
        child: Lottie.asset(
          'assets/anmations/search.json',
          repeat: true,
        ),
      ),
    );
  }
}

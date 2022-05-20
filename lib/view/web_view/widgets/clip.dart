import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnimationClip extends StatelessWidget {
  const AnimationClip({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: 600,
      child: Lottie.asset(
          'assets/LottieAnimations/seekHelp.json'),
    );
  }
}

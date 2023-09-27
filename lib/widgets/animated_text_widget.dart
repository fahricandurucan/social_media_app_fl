import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app_fl/utils/theme.dart';

class AnimatedTextWidget extends StatelessWidget {
  final String text;
  const AnimatedTextWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w500,
        fontFamily: 'Agne',
      ),
      child: AnimatedTextKit(
        animatedTexts: [
          TypewriterAnimatedText(
            text,
            textStyle: const TextStyle(color: CColors.white),
            speed: const Duration(milliseconds: 100),
            cursor: "",
          ),
        ],
        totalRepeatCount: 1,
      ),
    );
  }
}

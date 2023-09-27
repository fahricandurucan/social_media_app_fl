import 'package:flutter/material.dart';
import 'package:social_media_app_fl/utils/theme.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final Function() onTap;
  const ButtonWidget({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 56, 56, 56), shadowColor: CColors.cyan),
        onPressed: onTap,
        child: Text(
          text,
          style: const TextStyle(color: CColors.cyan),
        ));
  }
}

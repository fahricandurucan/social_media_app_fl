import 'package:flutter/material.dart';
import 'package:social_media_app_fl/utils/theme.dart';

class CircleAvatarWidget extends StatelessWidget {
  final double radius;
  const CircleAvatarWidget({super.key, required this.radius});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      child: Icon(
        Icons.person,
        color: CColors.cyan,
        size: radius,
      ),
    );
  }
}

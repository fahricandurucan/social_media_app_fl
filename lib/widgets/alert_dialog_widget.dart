import 'package:flutter/material.dart';
import 'package:social_media_app_fl/utils/theme.dart';

class AlertDialogWidget extends StatelessWidget {
  final Function()? onTapCamera;
  final Function()? onTapGallery;
  const AlertDialogWidget({super.key, required this.onTapCamera, required this.onTapGallery});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Edit Profile Image"),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: onTapCamera,
              child: const Text(
                "Camera",
                style: TextStyle(color: CColors.cyan),
              ),
            ),
            TextButton(
              onPressed: onTapGallery,
              child: const Text(
                "Gallery",
                style: TextStyle(color: CColors.cyan),
              ),
            )
          ],
        )
      ],
    );
  }
}

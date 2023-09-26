import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media_app_fl/controllers/register_controller.dart';
import 'package:social_media_app_fl/pages/navbar.dart';
import 'package:social_media_app_fl/pages/register_page.dart';

class RootWrapper extends StatelessWidget {
  const RootWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterController());
    return Obx(
      () => controller.loginLoading.value
          ? const Center(child: CircularProgressIndicator())
          : controller.user.value == null
              ? const RegisterPage()
              : const NavBar(),
    );
  }
}

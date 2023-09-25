import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media_app_fl/controllers/register_controller.dart';
import 'package:social_media_app_fl/pages/home_page.dart';
import 'package:social_media_app_fl/pages/login_page.dart';

class RootWrapper extends GetView<RegisterController> {
  const RootWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterController());

    return Obx(() => controller.currentUser.value == null ? const LoginPage() : const HomePage());
  }
}

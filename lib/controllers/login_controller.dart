import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  void onClose() {
    super.onClose();
    email.text = "";
    password.text = "";
  }
}

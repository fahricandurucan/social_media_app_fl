import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media_app_fl/models/user_model.dart';
import 'package:social_media_app_fl/services/auth_api.dart';

class RegisterController extends GetxController {
  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  final auth = FirebaseAuth.instance;
  final store = FirebaseFirestore.instance;

  final user = Rxn<User>();
  final currentUser = Rxn<UserModel>();

  final loginLoading = true.obs;

  final bottomNavIdx = 0.obs;

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    name.text = "";
    email.text = "";
    password.text = "";
  }

  @override
  void onInit() {
    user.bindStream(auth.authStateChanges());

    ever(user, (User? userState) async {
      if (user.value == null) {
        print("11111111111111111");
        currentUser.value = null;
        loginLoading.value = false;

        return;
      } else {
        print("222222222222222222222");

        currentUser.value = await AuthApi.getUser(user.value!.uid);
        print("current user = ${currentUser.value}");
      }

      bottomNavIdx.value = 0;
      loginLoading.value = false;
    });
    super.onInit();
  }
}

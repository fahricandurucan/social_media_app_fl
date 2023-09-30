import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_media_app_fl/controllers/register_controller.dart';
import 'package:social_media_app_fl/models/user_model.dart';
import 'package:social_media_app_fl/services/auth_api.dart';

class ProfilePageController extends GetxController {
  File? image;
  final imageTemporary = File("").obs;

  XFile? imagex;

  var profilUrl = "".obs;

  FirebaseAuth auth = FirebaseAuth.instance;

  final Box scoreBox = Hive.box("profilePhoto");

  var registerController = Get.find<RegisterController>();

  final currentUser = Rxn<UserModel>();

  @override
  Future<void> onInit() async {
    currentUser.value = await AuthApi.getUser(registerController.currentUser.value!.id);

    super.onInit();
    if (scoreBox.length != 0) {
      profilUrl.value = scoreBox.values.first;
    }
  }

  Future pickImage(ImageSource source) async {
    try {
      imagex = await ImagePicker().pickImage(source: source);
      if (imagex == null) {
        return;
      }
      imageTemporary.value = File(imagex!.path);
      var referans = FirebaseStorage.instance
          .ref()
          .child("profilImages")
          .child('${currentUser.value!.id}.png');
      UploadTask uploadTask = referans.putFile(imageTemporary.value);
      await uploadTask.whenComplete(() => print("image updated"));
      profilUrl.value = await referans.getDownloadURL();

      updateUserProfile(profilUrl.value);
      currentUser.value = await AuthApi.getUser(registerController.currentUser.value!.id);

      scoreBox.put("photoUrl", profilUrl.value);
      print("lenght = ${scoreBox.length}");
      print("profilUrl = $profilUrl");

      imagex = null;
    } on PlatformException catch (e) {
      print("wefwefwef");
      print("picImage = $e");
    }
  }

  Future<void> updateUserProfile(String url) async {
    try {
      final docUser = FirebaseFirestore.instance
          .collection("users")
          .doc(registerController.currentUser.value!.id);
      docUser.update({'profileImage': url});
    } catch (e) {
      print("Kullanıcı adı güncelleme hatası: $e");
    }
  }
}

import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePageController extends GetxController {
  File? image;
  final imageTemporary = File("").obs;

  XFile? imagex;

  var profilUrl = "".obs;

  FirebaseAuth auth = FirebaseAuth.instance;

  final Box scoreBox = Hive.box("profilePhoto");

  @override
  Future<void> onInit() async {
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
      var referans = FirebaseStorage.instance.ref().child("profilImages").child('profil.png');
      UploadTask uploadTask = referans.putFile(imageTemporary.value);
      await uploadTask.whenComplete(() => print("image updated"));
      profilUrl.value = await referans.getDownloadURL();

      scoreBox.put("photoUrl", profilUrl.value);
      print("lenght = ${scoreBox.length}");
      print("profilUrl = $profilUrl");

      imagex = null;
    } on PlatformException catch (e) {
      print("wefwefwef");
      print("picImage = $e");
    }
  }
}

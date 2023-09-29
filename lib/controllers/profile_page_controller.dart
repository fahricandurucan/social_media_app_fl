import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePageController extends GetxController {
  File? image;
  final imageTemporary = File("").obs;

  XFile? imagex;

  var profilUrl = "".obs;

  FirebaseAuth auth = FirebaseAuth.instance;

  Future pickImage(ImageSource source) async {
    try {
      imagex = await ImagePicker().pickImage(source: source);
      if (imagex == null) {
        return;
      }
      imageTemporary.value = File(imagex!.path);
      var referans = FirebaseStorage.instance.ref().child("profilImages").child('profil.png');
      UploadTask uploadTask = referans.putFile(imageTemporary.value);
      await uploadTask.whenComplete(() => print("ımage updated"));
      profilUrl.value = await referans.getDownloadURL();
      print("profilUrl = $profilUrl");

      imagex = null;
    } on PlatformException catch (e) {
      print("wefwefwef");
      print("picImage = $e");
    }
  }
}

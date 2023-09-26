import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddingPostController extends GetxController {
  File? image;
  final imageTemporary = File("").obs;

  XFile? imagex;

  final date = DateTime.now().obs;

  var url = "".obs;

  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  Future pickImage(ImageSource source) async {
    try {
      imagex = await ImagePicker().pickImage(source: source);
      if (imagex == null) {
        print("xxxxxxxxxxxxxxxxxxxxxxxx");
        return;
      }
      imageTemporary.value = File(imagex!.path);
      var referans = FirebaseStorage.instance.ref().child("posts").child('${DateTime.now()}.jpg');
      UploadTask uploadTask = referans.putFile(imageTemporary.value);
      await uploadTask.whenComplete(() => print("ımage updated"));
      url.value = await referans.getDownloadURL();
      print("url = $url");

      date.value = DateTime.now();
      imagex = null;
    } on PlatformException catch (e) {
      print("wefwefwef");
      print("picImage = $e");
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    title.text = "";
    description.text = "";
  }
}

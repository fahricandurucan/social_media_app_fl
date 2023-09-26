import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddingPostController extends GetxController {
  File? image;
  final imageTemporary = File("").obs;

  final title = TextEditingController();
  final description = TextEditingController();

  Future pickImage(ImageSource source) async {
    try {
      final imagex = await ImagePicker().pickImage(source: source);
      if (imagex == null) {
        print("xxxxxxxxxxxxxxxxxxxxxxxx");
        return;
      }
      imageTemporary.value = File(imagex.path);
    } on PlatformException catch (e) {
      print("wefwefwef");
      print(e.toString());
    }
  }
}

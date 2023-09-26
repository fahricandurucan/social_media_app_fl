import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_media_app_fl/controllers/adding_post_controller.dart';

class AddingPostPage extends StatelessWidget {
  const AddingPostPage({super.key});

  @override
  Widget build(BuildContext context) {
    final addingPostController = Get.put(AddingPostController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Ekleme Sayfası'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Obx(
                () => addingPostController.imageTemporary.value != File("")
                    ? Container(
                        height: 200,
                        width: double.infinity,
                        color: Colors.amberAccent,
                        child: Image.file(
                          addingPostController.imageTemporary.value,
                          width: 160,
                          height: 160,
                          fit: BoxFit.cover,
                        ),
                      )
                    : const FlutterLogo(
                        size: 160,
                      ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        addingPostController.pickImage(ImageSource.gallery);
                      },
                      child: const Text("Gallery")),
                  ElevatedButton(
                      onPressed: () {
                        addingPostController.pickImage(ImageSource.camera);
                      },
                      child: const Text("Camera")),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                'Başlık',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: addingPostController.title,
                decoration: const InputDecoration(
                  hintText: 'Başlık girin',
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'İçerik',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: addingPostController.description,
                maxLines: 2,
                decoration: const InputDecoration(
                  hintText: 'İçerik girin',
                ),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Postu Gönder'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_media_app_fl/controllers/adding_post_controller.dart';
import 'package:social_media_app_fl/controllers/register_controller.dart';
import 'package:social_media_app_fl/models/post.dart';
import 'package:social_media_app_fl/services/post_api.dart';
import 'package:social_media_app_fl/utils/theme.dart';
import 'package:social_media_app_fl/widgets/button_widget.dart';

class AddingPostPage extends StatelessWidget {
  const AddingPostPage({super.key});

  @override
  Widget build(BuildContext context) {
    final addingPostController = Get.put(AddingPostController());
    final registerController = Get.find<RegisterController>();
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
                () => addingPostController.url.value != ""
                    ? SizedBox(
                        height: 200,
                        width: double.infinity,
                        child: Image.network(
                          addingPostController.url.value,
                          width: 160,
                          height: 160,
                          fit: BoxFit.cover,
                        ),
                      )
                    : Container(
                        width: double.infinity,
                        height: 200,
                        decoration: BoxDecoration(border: Border.all(color: CColors.black)),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.camera_alt_rounded,
                              size: 80,
                            ),
                            Text("Add Photo")
                          ],
                        )),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ButtonWidget(
                    text: "Gallery",
                    onTap: () {
                      addingPostController.pickImage(ImageSource.gallery);
                    },
                  ),
                  ButtonWidget(
                    text: "Camera",
                    onTap: () {
                      addingPostController.pickImage(ImageSource.camera);
                    },
                  )
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
              ButtonWidget(
                text: "Postu Gönder",
                onTap: () {
                  if (addingPostController.title.text == "" ||
                      addingPostController.title.text == "") {
                    Get.snackbar("Hata", "Litfen boşlukları doldurunuz.");
                  } else {
                    final post = Post(
                        userName: registerController.currentUser.value!.name,
                        title: addingPostController.title.text,
                        description: addingPostController.description.text,
                        image: addingPostController.url.value,
                        date: Timestamp.now());

                    EasyLoading.show(maskType: EasyLoadingMaskType.clear, status: "post loading");
                    Future.delayed(const Duration(seconds: 2), () {
                      PostApi.addPost(registerController.auth.currentUser!.uid, post);
                      PostApi.addAllPost(post);
                      addingPostController.title.text = "";
                      addingPostController.description.text = "";
                      addingPostController.url.value = "";
                      EasyLoading.dismiss();
                    });
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

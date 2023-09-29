import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_media_app_fl/controllers/profile_page_controller.dart';
import 'package:social_media_app_fl/controllers/register_controller.dart';
import 'package:social_media_app_fl/pages/login_page.dart';
import 'package:social_media_app_fl/widgets/alert_dialog_widget.dart';
import 'package:social_media_app_fl/widgets/animated_text_widget.dart';
import 'package:social_media_app_fl/widgets/circle_avatar_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final registerController = Get.find<RegisterController>();
    final profilController = Get.put(ProfilePageController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const AnimatedTextWidget(text: "My Profile "),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialogWidget(
                        onTapCamera: () {
                          profilController.pickImage(ImageSource.camera);
                          Get.back();
                        },
                        onTapGallery: () {
                          Get.back();
                        },
                      ));
            },
            icon: const Icon(Icons.edit),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Obx(
              () => profilController.profilUrl.value != ""
                  ? ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(75),
                      ),
                      child: SizedBox(
                        width: 150,
                        height: 150,
                        child: Image.network(
                          profilController.profilUrl.value,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  : const CircleAvatarWidget(radius: 80),
            ),
            const SizedBox(height: 20),
            Text(
              registerController.currentUser.value!.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Kullanıcı Açıklaması',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      'Takipçiler',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '1000',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text(
                      'Takip',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '500',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                EasyLoading.show();
                Future.delayed(const Duration(seconds: 1), () {
                  Get.offAll(const LoginPage());
                  EasyLoading.dismiss();
                });
              },
              child: const Text('Çıkış Yap'),
            ),
          ],
        ),
      ),
    );
  }
}

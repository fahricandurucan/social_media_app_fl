import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:social_media_app_fl/controllers/register_controller.dart';
import 'package:social_media_app_fl/pages/adding_post_page.dart';
import 'package:social_media_app_fl/pages/home_page.dart';
import 'package:social_media_app_fl/pages/profile_page.dart';
import 'package:social_media_app_fl/pages/yours_post_page.dart';
import 'package:social_media_app_fl/utils/theme.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterController());

    return Scaffold(
      body: Obx(() => controller.bottomNavIdx.value == 0
          ? const HomePage()
          : controller.bottomNavIdx.value == 1
              ? const YoursPostPage()
              : controller.bottomNavIdx.value == 2
                  ? const AddingPostPage()
                  : const ProfilePage()),
      bottomNavigationBar: Obx(
        () => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: GNav(
            rippleColor: Colors.grey[300]!,
            hoverColor: Colors.grey[100]!,
            gap: 8,
            activeColor: CColors.cyan,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            tabBackgroundColor: const Color.fromARGB(255, 230, 230, 230).withOpacity(.5),
            onTabChange: (index) {
              controller.bottomNavIdx.value = index;
              print(controller.bottomNavIdx.value.toString());
            },
            selectedIndex: controller.bottomNavIdx.value,
            tabs: const [
              GButton(
                icon: Icons.home,
                text: "Home",
                iconColor: Colors.grey,
              ),
              GButton(
                icon: Icons.local_post_office_rounded,
                text: "Yours",
                iconColor: Colors.grey,
              ),
              GButton(
                icon: Icons.add_a_photo_rounded,
                text: "Post",
                iconColor: Colors.grey,
              ),
              GButton(
                icon: Icons.person,
                text: "Profile",
                iconColor: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

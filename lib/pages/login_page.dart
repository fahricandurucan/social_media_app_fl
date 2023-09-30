import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media_app_fl/controllers/login_controller.dart';
import 'package:social_media_app_fl/pages/register_page.dart';
import 'package:social_media_app_fl/services/auth_api.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: loginController.email,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: loginController.password,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    AuthApi.signIn(
                        email: loginController.email.text, password: loginController.password.text);
                    loginController.email.text = "";
                    loginController.password.text = "";
                    print("00000000000000 ${loginController.email.text}");
                  },
                  child: const Text('Log in'),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("or..."),
                TextButton(
                    onPressed: () {
                      Get.offAll(const RegisterPage());
                    },
                    child: const Text("register"))
              ],
            )
          ],
        ),
      ),
    );
  }
}

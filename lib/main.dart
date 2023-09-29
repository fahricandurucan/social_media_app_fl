import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:social_media_app_fl/firebase_options.dart';
import 'package:social_media_app_fl/pages/splash_page.dart';
import 'package:social_media_app_fl/utils/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await Hive.initFlutter();
  await Hive.openBox('profilePhoto');

  EasyLoading.instance
    ..indicatorColor = Colors.white
    ..indicatorSize = 80
    ..errorWidget = const Icon(Icons.warning)
    ..indicatorType = EasyLoadingIndicatorType.circle;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.grey[900],
        primaryColor: CColors.cyan,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      darkTheme: ThemeData.dark(),
      home: const SplashPage(),
      builder: EasyLoading.init(),
    );
  }
}

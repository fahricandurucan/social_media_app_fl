import 'package:flutter/material.dart';
import 'package:social_media_app_fl/utils/const.dart';
import 'package:social_media_app_fl/widgets/post_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("SoSocial"),
      ),
      body: ListView.builder(
          itemCount: Const.dummyPosts.length,
          itemBuilder: (context, index) {
            final post = Const.dummyPosts[index];
            return PostWidget(
              post: post,
            );
          }),
    );
  }
}

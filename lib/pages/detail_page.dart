import 'package:flutter/material.dart';
import 'package:social_media_app_fl/models/post.dart';
import 'package:social_media_app_fl/widgets/post_widget.dart';

class DetailPage extends StatelessWidget {
  final Post post;
  const DetailPage({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detay"),
      ),
      body: Center(child: PostWidget(post: post)),
    );
  }
}

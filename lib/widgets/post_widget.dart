import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:social_media_app_fl/models/post.dart';
import 'package:social_media_app_fl/pages/detail_page.dart';

class PostWidget extends StatelessWidget {
  final Post post;
  const PostWidget({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(post.title),
              ],
            ),
          ),
          ClipRRect(
            child: GestureDetector(
              onTap: () {
                Get.to(DetailPage(post: post));
              },
              child: Container(
                  width: double.infinity,
                  height: 250,
                  decoration: const BoxDecoration(color: Colors.greenAccent),
                  child: Image.network(
                    post.image,
                    fit: BoxFit.cover,
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ReadMoreText(
              post.description,
              trimLines: 1,
              colorClickableText: Colors.pink,
              trimMode: TrimMode.Line,
              trimCollapsedText: 'more',
              trimExpandedText: 'less',
              moreStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              lessStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

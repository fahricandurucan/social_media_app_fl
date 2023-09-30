import 'package:flutter/material.dart';
import 'package:social_media_app_fl/services/post_api.dart';
import 'package:social_media_app_fl/utils/const.dart';
import 'package:social_media_app_fl/widgets/animated_text_widget.dart';
import 'package:social_media_app_fl/widgets/post_widget.dart';

class YoursPostPage extends StatelessWidget {
  const YoursPostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const AnimatedTextWidget(text: "Your Posts"),
      ),
      body: StreamBuilder(
          stream: PostApi.getPostsByUser(Const.userID),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var postList = snapshot.data;

              return postList!.isNotEmpty
                  ? ListView.builder(
                      itemCount: postList.length,
                      itemBuilder: (context, index) {
                        var post = postList[index];
                        return PostWidget(post: post);
                      })
                  : const Center(
                      child: Text("You don't have any posts..!"),
                    );
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }
}

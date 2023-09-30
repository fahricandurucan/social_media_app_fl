import 'package:flutter/material.dart';
import 'package:social_media_app_fl/services/post_api.dart';
import 'package:social_media_app_fl/utils/const.dart';
import 'package:social_media_app_fl/widgets/animated_text_widget.dart';
import 'package:social_media_app_fl/widgets/post_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Image.asset(
            "assets/sosocial.png",
          ),
        ),
        centerTitle: true,
        title: const AnimatedTextWidget(
          text: "SoSocial",
        ),
      ),
      body: StreamBuilder(
        stream: PostApi.getAllPosts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var postList = snapshot.data;
            postList!.addAll(Const.dummyPosts);
            print("snapshot data = ${postList.length}");
            return postList.isNotEmpty
                ? ListView.builder(
                    itemCount: postList.length + 1, // 1 yatay listview eklendi
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return SizedBox(
                          height: 100,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Container(
                                  height: 100,
                                  width: 100,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.greenAccent,
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      } else {
                        final post = postList[index - 1];
                        return PostWidget(
                          post: post,
                        );
                      }
                    },
                  )
                : const Center(
                    child: Text("error"),
                  );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

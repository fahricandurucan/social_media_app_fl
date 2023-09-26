import 'package:flutter/material.dart';
import 'package:social_media_app_fl/services/post_api.dart';
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
      body: StreamBuilder(
          stream: PostApi.getAllPosts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var postList = snapshot.data;
              postList!.addAll(Const.dummyPosts);
              print("snapshot data = ${postList.length}");
              return postList.isNotEmpty
                  ? ListView.builder(
                      itemCount: postList.length,
                      itemBuilder: (context, index) {
                        final post = postList[index];
                        return PostWidget(
                          post: post,
                        );
                      })
                  : const Center(
                      child: Text("error"),
                    );
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }
}

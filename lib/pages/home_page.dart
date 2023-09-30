import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_paginate_firestore/paginate_firestore.dart';
import 'package:social_media_app_fl/models/post.dart';
import 'package:social_media_app_fl/services/auth_api.dart';
import 'package:social_media_app_fl/utils/theme.dart';
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
      body: Column(
        children: [
          SizedBox(
            height: 105,
            child: StreamBuilder(
                stream: AuthApi.getAllUser(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var userList = snapshot.data;
                    return userList!.isNotEmpty
                        ? ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: userList.length,
                            itemBuilder: (context, index) {
                              var user = userList[index];
                              return user.profileImage != ''
                                  ? Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.all(Radius.circular(50)),
                                        child: SizedBox(
                                          height: 80,
                                          width: 80,
                                          child: Image.network(
                                            user.profileImage,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.all(Radius.circular(50)),
                                        child: Container(
                                            height: 80,
                                            width: 80,
                                            color: CColors.black,
                                            child: const Icon(
                                              Icons.person,
                                              size: 45,
                                              color: CColors.cyan,
                                            )),
                                      ),
                                    );
                            },
                          )
                        : const SizedBox();
                  }
                  return const Center(child: CircularProgressIndicator());
                }),
          ),
          Expanded(
            child: PaginateFirestore(
              query: FirebaseFirestore.instance
                  .collection("allPost")
                  .orderBy("date", descending: true),
              itemBuilderType: PaginateBuilderType.listView,
              itemsPerPage: 3,
              isLive: true,
              initialLoader: const Center(child: CircularProgressIndicator.adaptive()),
              onEmpty: const Center(
                child: Text("Empty Data"),
              ),
              onError: (e) => const Center(
                child: Text("error loading data"),
              ),
              bottomLoader: const Center(child: CircularProgressIndicator.adaptive()),
              itemBuilder: (context, snapshot, index) {
                final Map<String, dynamic> json = snapshot[index].data() as Map<String, dynamic>;

                final Timestamp date = json['date'];
                final String description = json['description'];
                final String image = json['image'];
                final String title = json['title'];
                final String userName = json['userName'];

                Post newPost = Post(
                  userName: userName,
                  title: title,
                  description: description,
                  image: image,
                  date: date,
                );

                return PostWidget(post: newPost);
              },
            ),
          ),
        ],
      ),
      // body: StreamBuilder(
      //   stream: PostApi.getAllPosts(),
      //   builder: (context, snapshot) {
      //     if (snapshot.hasData) {
      //       var postList = snapshot.data;
      //       postList!.addAll(Const.dummyPosts);
      //       print("snapshot data = ${postList.length}");
      //       return postList.isNotEmpty
      //           ? ListView.builder(
      //               itemCount: postList.length + 1, // 1 yatay listview eklendi
      //               itemBuilder: (context, index) {
      //                 if (index == 0) {
      //                   return SizedBox(
      //                     height: 100,
      //                     child: ListView.builder(
      //                       scrollDirection: Axis.horizontal,
      //                       itemCount: 10,
      //                       itemBuilder: (context, index) {
      //                         return Padding(
      //                           padding: const EdgeInsets.all(12.0),
      //                           child: Container(
      //                             height: 100,
      //                             width: 100,
      //                             decoration: const BoxDecoration(
      //                               shape: BoxShape.circle,
      //                               color: Colors.greenAccent,
      //                             ),
      //                           ),
      //                         );
      //                       },
      //                     ),
      //                   );
      //                 } else {
      //                   final post = postList[index - 1];
      //                   return PostWidget(
      //                     post: post,
      //                   );
      //                 }
      //               },
      //             )
      //           : const Center(
      //               child: Text("error"),
      //             );
      //     }
      //     return const Center(child: CircularProgressIndicator());
      //   },
      // ),
    );
  }
}

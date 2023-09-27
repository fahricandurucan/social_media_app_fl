import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:social_media_app_fl/models/post.dart';
import 'package:social_media_app_fl/pages/detail_page.dart';
import 'package:social_media_app_fl/utils/theme.dart';

class PostWidget extends StatelessWidget {
  final Post post;
  const PostWidget({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Color.fromARGB(255, 53, 53, 53),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      child: Icon(
                        Icons.person,
                        color: CColors.cyan,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        Text(post.userName),
                        Text(
                          DateFormat.yMMMEd().format(
                            post.date!.toDate(),
                          ),
                          style: const TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     children: [
              //       Text(post.title),
              //     ],
              //   ),
              // ),
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
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                child: Row(children: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border)),
                  const Text("0 likes"),
                ]),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                child: Row(
                  children: [
                    const Text(
                      "kullanıcı adı",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Text(
                        post.description,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              )

              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
              //   child: ReadMoreText(
              //     post.description,
              //     trimLines: 2,
              //     colorClickableText: Colors.pink,
              //     trimMode: TrimMode.Line,
              //     trimCollapsedText: 'more',
              //     trimExpandedText: 'less',
              //     moreStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              //     lessStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

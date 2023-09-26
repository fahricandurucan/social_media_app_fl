import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social_media_app_fl/models/post.dart';

class PostApi {
  static FirebaseFirestore store = FirebaseFirestore.instance;

  static Future<String?> addPost(String uid, Post post) async {
    try {
      await store.collection('users').doc(uid).collection('posts').add(post.toMap());
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  static Future<String?> addAllPost(Post post) async {
    try {
      await store.collection('allPost').add(post.toMap());
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  static Stream<List<Post>> getAllPosts() {
    final result = store.collection("allPost").snapshots();
    final streamList =
        result.map((event) => event.docs.map((e) => Post.fromMap(e.data())).toList());

    return streamList;
  }
}

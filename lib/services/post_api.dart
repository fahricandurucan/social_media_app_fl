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
    final result = store.collection("allPost").orderBy('date', descending: true).snapshots();
    final streamList =
        result.map((event) => event.docs.map((e) => Post.fromMap(e.data())).toList());

    return streamList;
  }

  static Stream<List<Post>> getPostsByUser(String uid) {
    final result = store
        .collection("users")
        .doc(uid)
        .collection("posts")
        .orderBy('date', descending: true)
        .snapshots();
    final streamList =
        result.map((event) => event.docs.map((e) => Post.fromMap(e.data())).toList());

    return streamList;
  }

//   Future<void> getPostsOrderedByDate() async {
//   try {
//     CollectionReference postsRef = FirebaseFirestore.instance.collection('posts');

//     QuerySnapshot querySnapshot = await postsRef
//         .orderBy('date', descending: true)
//         .get();

//     List<DocumentSnapshot> documents = querySnapshot.docs;

//     for (DocumentSnapshot doc in documents) {
//       print(doc.data());
//     }
//   } catch (e) {
//     print('Verileri getirirken hata oluştu: $e');
//   }
// }
}

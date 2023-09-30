import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:social_media_app_fl/controllers/register_controller.dart';
import 'package:social_media_app_fl/models/user_model.dart';
import 'package:social_media_app_fl/pages/root_wrapper.dart';

class AuthApi {
  static RegisterController registerController = Get.put(RegisterController());
  static CollectionReference<Map<String, dynamic>> userCollection =
      FirebaseFirestore.instance.collection("users");

  static FirebaseFirestore store = FirebaseFirestore.instance;

  static FirebaseAuth auth = FirebaseAuth.instance;

  static Future<void> signUp(
      {required String name, required String email, required String password}) async {
    try {
      final UserCredential userCredintial =
          await auth.createUserWithEmailAndPassword(email: email, password: password);
      if (userCredintial.user != null) {
        registerController.currentUser.value = UserModel(
            id: userCredintial.user!.uid,
            name: name,
            email: email,
            password: password,
            profileImage: '');
        registerUser(registerController.currentUser.value!);
      }
    } on FirebaseAuthException catch (e) {
      print(e.toString());
    }
  }

  static Future<void> signIn({required String email, required String password}) async {
    try {
      final UserCredential userCredential =
          await auth.signInWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        print("GİRİŞ BAŞARILI");
        Get.offAll(const RootWrapper());
      }
    } on FirebaseAuthException catch (e) {
      print(e.toString());
    }
  }

  static Future<UserModel?> getUser(String uid) async {
    print("uid = $uid");
    final userDoc = await store.collection('users').doc(uid).get();

    final user = userDoc.data();
    print(user?["name"]);

    return UserModel.fromMap(user!);
  }

  static Stream<List<UserModel>> getAllUser() {
    final result = store.collection("users").snapshots();
    final streamList =
        result.map((event) => event.docs.map((e) => UserModel.fromMap(e.data())).toList());

    return streamList;
  }

  static Future<void> registerUser(UserModel userModel) async {
    try {
      await userCollection.doc(userModel.id).set(userModel.toMap());
    } catch (e) {
      print(e.toString());
    }
  }

  static Future<void> updateProfilePhotoUser(String uid, String url) async {
    await userCollection.doc(uid).update({"profileImage": url});
  }

  static Future<void> signOut() async {
    try {
      await auth.signOut();
      Get.offAll(const RootWrapper());
    } catch (err) {
      print("Sign Out Error: $err");
    }
  }
}

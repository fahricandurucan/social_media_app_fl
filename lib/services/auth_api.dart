import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_media_app_fl/models/user_model.dart';

class AuthApi {
  static CollectionReference<Map<String, dynamic>> userCollection =
      FirebaseFirestore.instance.collection("users");

  static FirebaseAuth auth = FirebaseAuth.instance;

  static Future<void> signUp(
      {required String name, required String email, required String password}) async {
    try {
      final UserCredential userCredintial =
          await auth.createUserWithEmailAndPassword(email: email, password: password);
      if (userCredintial.user != null) {
        registerUser(name, email, password);
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
      }
    } on FirebaseAuthException catch (e) {
      print(e.toString());
    }
  }

  static Future<UserModel> getUser(String uid) async {
    final userDoc = await userCollection.doc(uid).get();

    final user = userDoc.data();

    return UserModel.fromMap(user!);
  }

  static Future<void> registerUser(String name, String email, String password) async {
    await userCollection.doc().set({
      "name": name,
      "email": email,
      "password": password,
    });
  }
}

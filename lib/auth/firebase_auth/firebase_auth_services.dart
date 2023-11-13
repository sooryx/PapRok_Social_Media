import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';



class FirebaseAuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signUpWithEmailAndPassword(String officialname, String Username,
      String email, String password, String bio, ) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      final username = Username;
      createUserDocument(
          credential, username, password, officialname, bio, );
    } catch (e) {
      print("some error occured");
    }
  }

  Future<void> createUserDocument(
    UserCredential? userCredential,
    String username,
    String password,
    String officialname,
    String bio,
  ) async {
    if (userCredential != null && userCredential.user != null) {
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(userCredential.user!.uid)
          .set({
        'official name': officialname,
        'username': username,
        'email': userCredential.user!.email,
        'password': password,
        'bio': bio,
      });
    }
  }

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } catch (e) {
      print("some error occured");
    }
  }
}

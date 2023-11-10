import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class FirebaseAuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signUpWithEmailAndPassword(
      String email, String password, String Username) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
     final username = Username;
      createUserDocument(credential,username,password);

    } catch (e) {
      print("some error occured");
    }
  }

  Future<void>createUserDocument (UserCredential? userCredential,String username,String password)async{
    if(userCredential != null && userCredential.user != null){
      await FirebaseFirestore.instance.collection("Users").doc(userCredential.user!.uid).set({
      'email':userCredential.user!.email,
        'username': username,
        'password':password,
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


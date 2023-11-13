import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:socialmedia/components/my_textfields.dart';
import 'dart:io';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String username = "";
  String emailid = "";
  String officialname = "";
  String bio = "";
  String passwords = "";
  TextEditingController EditUsernameController = TextEditingController();
  TextEditingController EditNameController = TextEditingController();
  TextEditingController EditEmailController = TextEditingController();
  TextEditingController EditbioController = TextEditingController();
  TextEditingController EditpasswordController = TextEditingController();

  _profileInfo() async {
    try {
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user != null) {
          print(user.uid);
          print(user.displayName);
          setState(() {
            username = user.displayName.toString();
            emailid = user.email.toString();
          });
          EditEmailController.text = emailid;
        }
      });
    } catch (e) {
      print("Error: $e");
      setState(() {
        username = "Paproker";
      });
    }
  }

  Future<void> _fetchUserData() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        // Fetch data from Firestore
        DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await FirebaseFirestore.instance
            .collection('Users')
            .doc(user.uid)
            .get();

        if (documentSnapshot.exists) {
          Map<String, dynamic> userData = documentSnapshot.data()!;

          setState(() {
            username = userData['username'] ?? "Paproker";
            emailid = user.email ?? "";
            officialname = userData['official name'] ?? "Paprok";
            bio = userData['bio'] ?? "Add your bio ";
            passwords = userData['password'] ?? "Add your bio ";
          });

          // Set the username to the controller
          EditNameController.text = officialname;
          EditUsernameController.text = username;
          EditbioController.text = bio;
          EditpasswordController.text = passwords;
        }
      }
    } catch (e) {
      print("Error: $e");
      setState(() {
        username = "Paproker";
      });
    }
  }

  // Function to update user profile data in Firestore
  Future<void> _updateUserProfile() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      try {
        await FirebaseFirestore.instance.collection('Users').doc(user.uid).update({
          'username': EditUsernameController.text,
          'official name': EditNameController.text,
          'bio': EditbioController.text,
        });
        print('User profile updated successfully');
      } catch (e) {
        print('Error updating user profile: $e');
      }
    }
  }

  @override
  void initState() {
    _profileInfo();
    _fetchUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 6,
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            color: Colors.green,
            iconSize: 30.sp,
            onPressed: () {
              _tohome();// Call function to update user profile
            },
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20.h,
            ),
            Container(
              padding: EdgeInsets.all(25.dg),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.primary
              ),
              child: Icon(Icons.person,size: 50.sp,),
            ),
            SizedBox(
              height: 20.h,
            ),
            MyTextField(
              hintText: 'Your Username',
              icon: Icon(Icons.alternate_email_rounded),
              obscureText: false,
              controller: EditUsernameController,
            ),
            SizedBox(
              height: 20.h,
            ),
            MyTextField(
                hintText: 'Your Name',
                icon: Icon(Icons.abc),
                obscureText: false,
                controller: EditNameController),
            SizedBox(
              height: 20.h,
            ),
            MyTextField(
                hintText: 'Your Email ID',
                icon: Icon(Icons.mail_outline_rounded),
                obscureText: false,
                controller: EditEmailController),
            SizedBox(
              height: 20.h,
            ),
            MyTextField(
                hintText: '',
                icon: Icon(Icons.remove_red_eye),
                obscureText: true,
                controller: EditpasswordController),
            SizedBox(
              height: 20.h,
            ),
            MyTextField(
                maxLength: 150,
                hintText: 'Your Description',
                icon: Icon(Icons.info_outline),
                obscureText: false,
                controller: EditbioController),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }

  void _tohome() {
    _updateUserProfile();
    Fluttertoast.showToast(
        msg: "Profile Updated Succefully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 12.0);
    Navigator.pushNamed(context, '/home');
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:socialmedia/auth/login_or_register.dart';
import 'package:socialmedia/components/my_drawer.dart';
import 'package:socialmedia/components/my_textfields.dart';
import 'package:socialmedia/components/wallpost.dart';

class Homepage extends StatefulWidget {
  Homepage({
    super.key,
  });

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String username = "";
  String profilePhoto = "";
  String emailid = "";
  String officialname = "";
  TextEditingController postController = TextEditingController();

  final currentUser = FirebaseAuth.instance.currentUser!;

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
          });

          // Set the username to the controller
        }
      }
    } catch (e) {
      print("Error: $e");
      setState(() {
        username = "Paproker";
      });
    }
  }

  void _postmessage() {
    if (postController.text.isNotEmpty) {
      FirebaseFirestore.instance.collection("Users").add({
        'UserEmail': username,
        'Message': postController.text,
        'Timestamp': Timestamp.now(),
      });
    }
  }

  @override
  void initState() {
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
            Icon(
              Icons.perm_identity,
              color: Theme.of(context).colorScheme.onSurface,
              size: 30.sp,
            )
          ],
        ),
        drawer: MyDrawer(),
        body: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            Text(
              "Logged in as : ${username.isNotEmpty ? username : emailid}",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
            ),
            SizedBox(height: 20.h),
            Expanded(
                child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('Users')
                  .orderBy("Timestamp", descending: false)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      final post = snapshot.data!.docs[index];
                      return WallPost(
                        message: post['Message'],
                        user: post['UserEmail'],
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error:' + snapshot.error.toString()),
                  );
                }
                return CircularProgressIndicator();
              },
            )),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.all(25.dg),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: MyTextField(
                    hintText: 'Write something on the wall',
                    controller: postController,
                    obscureText: false,
                  )),
                  IconButton(
                      onPressed: () {
                        _postmessage();
                        print('hey');
                      },
                      icon: Icon(Icons.arrow_circle_up))
                ],
              ),
            )
          ],
        ));
  }
}

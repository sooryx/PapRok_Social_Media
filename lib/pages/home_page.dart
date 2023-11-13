import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:socialmedia/auth/login_or_register.dart';
import 'package:socialmedia/components/my_drawer.dart';
import 'package:socialmedia/components/my_textfields.dart';
import 'package:socialmedia/components/wallpost.dart';
import 'package:socialmedia/pages/write_a_post.dart';

class Homepage extends StatefulWidget {
  Homepage({
    super.key,
  });

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String profilePhoto = "";
  String username = "";
  String emailid = "";
  String officialname = "";
  TextEditingController postController = TextEditingController();

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
      FirebaseFirestore.instance
          .collection("User Post")
          .add({
        'UserName': username,
        'Message': postController.text,
        'Timestamp': Timestamp.now(),
      });
    }
  }

  Future<void> _handleRefresh() async {
    // Implement your refresh logic here, for example, refetch data from Firestore
    await _fetchUserData();
    setState(() {
      // Update your state as needed
    });
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
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .background,
        elevation: 6,
        title: Center(child: Text("P A P R O K")),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 10.w),
              child: IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => WritePost()));
                  },
                  icon: Icon(Icons.post_add_rounded,
                    size: 27.sp,)
              ))
        ],
      ),
      drawer: MyDrawer(),
      body: LiquidPullToRefresh(
        onRefresh: _handleRefresh,
        child: ListView(
          children: [
            SizedBox(height: 20.h),
            // Header content, if any
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('User Post')
                  .orderBy("Timestamp", descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      final post = snapshot.data!.docs[index];
                      return WallPost(
                        message: post['Message'] ?? "No message",
                        user: post['UserName'] ?? "Unknown-User",
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
            ),
            // Footer content, if any
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
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      _postmessage();
                    },
                    icon: Icon(Icons.arrow_circle_up),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

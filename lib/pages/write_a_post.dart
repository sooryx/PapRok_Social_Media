import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components/my_textfields.dart';

class WritePost extends StatelessWidget {
  String username ="";
  TextEditingController postController = TextEditingController();

  WritePost({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Center(child: Text("Post on Wall")),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Don't keep the coolness to yourself!",
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.dg),
            child: Text(
                "Share your thoughts on Paprok and turn up the volume on the coolest conversations.",
                style: TextStyle(fontSize: 16.sp)),
          ),
          Padding(
            padding: EdgeInsets.all(25.dg),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextField(
                    maxLength: 1000,
                    minLines: 4,
                    maxLines: 10,
                    controller: postController,
                    decoration: InputDecoration(
                      hintText: "Write something on the wall...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    _postmessage();
                  },
                  icon: Icon(
                    Icons.arrow_circle_up,
                    size: 35.sp,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
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
}

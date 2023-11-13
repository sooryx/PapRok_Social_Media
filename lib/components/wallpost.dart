import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:socialmedia/components/like_button.dart';

class WallPost extends StatefulWidget {
  final String message;
  final String user;
  final String postID;
  final List<String> likes;

  const WallPost({
    super.key,
    required this.message,
    required this.user,
    required this.postID,
    required this.likes,
  });

  @override
  State<WallPost> createState() => _WallPostState();
}

class _WallPostState extends State<WallPost> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  bool isLiked = false;

  @override
  void initState() {
    super.initState();
    isLiked = widget.likes.contains(currentUser.email);
  }

  void togglelike() {
    setState(() {
      isLiked = !isLiked;
    });

    ///Access the doc in firebase
    DocumentReference postRef =
    FirebaseFirestore.instance.collection('User Post').doc(widget.postID);

    if(isLiked) {
      ///post Liked
      postRef.update({
        'Likes': FieldValue.arrayUnion([currentUser.email])
      });
    }else{
      ///post Unliked
      postRef.update({
        'Likes':FieldValue.arrayRemove([currentUser.email])
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(25.dg),
        padding: EdgeInsets.all(15.dg),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: Theme.of(context).colorScheme.secondary),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(),
                  child: Icon(Icons.person),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  currentUser.displayName.toString(),
                  style: TextStyle(fontSize: 16.sp, color: Theme.of(context).colorScheme.onSurface),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
                height: 80.h,
                padding: EdgeInsets.all(10.dg),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    border: Border.all(color: Colors.grey, width: 0.4.w),
                    color: Theme.of(context).colorScheme.background),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.message,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary),
                    )
                  ],
                )),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                LikeButton(
                  isLiked: isLiked,
                  onTap: togglelike,
                )
              ],
            )
          ],
        ));
  }
}

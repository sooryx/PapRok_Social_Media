import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WallPost extends StatelessWidget {
  final String message;
  final String user;

  const WallPost({super.key, required this.message, required this.user,});

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
                  decoration: BoxDecoration(
                  ),
                  child: Icon(Icons.person),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(user,style: TextStyle(fontSize: 16.sp),),
              ],
            ),
            SizedBox(height: 20.h,),
            Container(
              height: 80.h,
              padding: EdgeInsets.all(10.dg),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    border: Border.all(
                      color: Colors.grey,
                      width: 0.4.w
                    ),
                    color: Theme.of(context).colorScheme.primary),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      message,textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary),
                    )
                  ],
                )),
            SizedBox(height: 20.h,),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //
            //   children: [
            //     // Icon(Icons.share),
            //     Icon(Icons.favorite_border_rounded)
            //   ],
            // )
          ],
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class Intro1 extends StatelessWidget {
  const Intro1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple.shade200,
      padding: EdgeInsets.all(10.dg),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Share your story,",style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),),
          Lottie.asset(
            "assets/lottie/intro_1.json",
            fit: BoxFit.contain
          ),
        ],
      ),
    );
  }
}

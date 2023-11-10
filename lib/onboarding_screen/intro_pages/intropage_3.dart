import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class Intro3 extends StatelessWidget {
  const Intro3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue.shade200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('and spark conversations on ',style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white
      ),),
            Text('PapRock!',style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black
      ),),
          ],
        ),
        Lottie.asset('assets/lottie/intro_3.json',fit: BoxFit.contain)
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:socialmedia/components/rounded%20Button.dart';

class RegistrationFirstScreen extends StatelessWidget {
  final PageController controller;

  const RegistrationFirstScreen({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(10.dg),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome to Paprok!",
                style: TextStyle(fontSize: 30.sp),
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                "Get ready to embark on a journey of connection and exploration.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              // Add any additional text or styling as needed
            ],
          ),
        ),
        RoundButton(
          icon: Icon(Icons.arrow_forward_ios_rounded),
          onPressed: () {
            controller.nextPage(
                duration: Duration(milliseconds: 5000), curve: Curves.bounceIn);
          },
        )
      ],
    );
  }
}

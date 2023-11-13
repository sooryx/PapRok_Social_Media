import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/my_textfields.dart';
import '../../components/rounded Button.dart';

class EmailID extends StatelessWidget {
  final PageController controller;
  final TextEditingController usernameController;
  final TextEditingController emailController;

  const EmailID(
      {super.key,
      required this.controller,
      required this.usernameController,
      required this.emailController});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.dg),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "@${usernameController.text} sounds cool",
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 30.sp,
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Container(
            padding: EdgeInsets.all(10.dg),
            child: Text(
              "Now, share your email ID. \n We'll keep it safe, promise!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 16.sp,
              ),
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          MyTextField(
            hintText: 'example@paprok.in',
            obscureText: false,
            controller: emailController,
            icon: Icon(Icons.mail_outline_rounded),
          ),
          SizedBox(
            height: 30.h,
          ),
          RoundButton(
            icon: Icon(Icons.arrow_forward_ios_rounded),
            onPressed: () {
              controller.nextPage(
                duration: Duration(milliseconds: 500),
                curve: Curves.bounceIn,
              );
            },
          )
        ],
      ),
    );
  }
}

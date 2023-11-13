import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/my_textfields.dart';
import '../../components/rounded Button.dart';

class UserName extends StatelessWidget {
  final PageController controller;
  final TextEditingController officialnameController;
  final TextEditingController usernameController;

  const UserName(
      {super.key,
      required this.officialnameController,
      required this.usernameController,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.dg),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Great ${officialnameController.text}, Now create your username for Paprok.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30.sp),
          ),
          SizedBox(
            height: 30.h,
          ),
          Container(
            padding: EdgeInsets.all(10.dg),
            child: Text(
              "Give yourself a unique identity by choosing a cool username for your paprok account.",
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
            hintText: 'p@prock',
            obscureText: false,
            controller: usernameController,
            icon: Icon(Icons.alternate_email_rounded),
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

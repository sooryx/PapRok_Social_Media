import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/my_textfields.dart';
import '../../components/rounded Button.dart';

class Passwords extends StatelessWidget {
  final TextEditingController passwordController;
  final TextEditingController confirmpasswordController;
  final PageController controller;
  const Passwords({super.key, required this.passwordController, required this.controller, required this.confirmpasswordController});

  @override
  Widget build(BuildContext context) {
    bool confirmpass = false;
    return Container(
      padding: EdgeInsets.all(10.dg),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Secure your account ",
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
              "Choose one that only you can crack! ",
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 14.sp,
              ),
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          MyTextField(
            hintText: 'Enter Password',
            obscureText: true,
            controller: passwordController,
            icon: Icon(Icons.lock),
          ),
          SizedBox(
            height: 20.h,
          ),
          MyTextField(
            hintText: 'Confirm Password',
            obscureText: true,
            controller: confirmpasswordController,
            icon: Icon(Icons.lock),
          ),
          SizedBox(height: 10.h,),
          confirmpass
              ? Text("Password do not match with each other ",
            style: TextStyle(color: Colors.red),)
              : SizedBox(
            height: 10.h,
          ),
          SizedBox(height: 10.h,),
          RoundButton(
            icon: Icon(Icons.arrow_forward_ios_rounded),
            onPressed: () {
              if (passwordController.text ==
                  confirmpasswordController.text) {
                controller.nextPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.bounceIn);
              } else {
               confirmpass =true;
              }
            },
          )
        ],
      ),
    );
  }
}

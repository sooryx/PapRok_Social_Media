import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../components/my_textfields.dart';
import '../../components/rounded Button.dart';

class OfficialName extends StatelessWidget {
  final PageController controller;
  final TextEditingController officialnameController;

  const OfficialName(
      {super.key, required this.controller, required this.officialnameController});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.dg),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "What is your name ?",
            style: TextStyle(fontSize: 30.sp),
          ),
          SizedBox(
            height: 30.h,
          ),
          MyTextField(
            hintText: 'p@prock',
            obscureText: false,
            controller: officialnameController,
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

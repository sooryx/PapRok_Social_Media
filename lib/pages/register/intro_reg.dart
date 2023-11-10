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
        Text(
          "Let's get started!",
          style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.onSurface),
        ),
        SizedBox(height: 30.h,),
        RoundButton(icon: Icon(Icons.arrow_forward_ios_rounded), onPressed: () {
          controller.nextPage(duration: Duration(milliseconds: 5000), curve: Curves.bounceIn);
        },)
      ],
    );
  }
}

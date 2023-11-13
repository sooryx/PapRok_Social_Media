import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/my_textfields.dart';
import '../../components/rounded Button.dart';

class Bio extends StatelessWidget {
  final TextEditingController bioController;
  final PageController controller;

  const Bio({super.key, required this.bioController, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.dg),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Add your bio",
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 30.sp,
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          TextField(
            minLines: 6,
            maxLines: 10,
            maxLength: 200,
            controller: bioController,
            decoration: InputDecoration(
              hintText: 'Short Bio',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          RoundButton(
            icon: Icon(Icons.arrow_forward_ios_rounded),
            onPressed: () {
              controller.nextPage(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.bounceInOut);
            },
          )
        ],
      ),
    );
  }
}

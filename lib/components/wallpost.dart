import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WallPost extends StatelessWidget {
  final String message;
  final String user;

  const WallPost({super.key, required this.message, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(25.dg),
      padding: EdgeInsets.all(25.dg),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: Theme.of(context).colorScheme.secondary),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                  padding: EdgeInsets.all(10.dg),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    shape: BoxShape.circle
                  ),
                  child: Icon(
                    Icons.person,
                    color: Theme.of(context).colorScheme.onSurface,
                    size: 40.sp,
                  ))
            ],
          ),
          SizedBox(width:20.w ,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(user),
              Text(message),
            ],
          )
        ],
      ),
    );
  }
}

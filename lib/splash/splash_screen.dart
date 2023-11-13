import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Theme.of(context).colorScheme.background,
      width: 300.w,
      height: 300.h,
      child: Image.asset(
        'assets/images/logo-removebg-preview.png',
        fit: BoxFit.fitHeight,
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:socialmedia/auth/login_or_register.dart';
import 'package:socialmedia/components/my_drawer.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          elevation: 6,
          actions: [
            Icon(
              Icons.perm_identity,
              color: Theme.of(context).colorScheme.onSurface,
              size: 30.sp,
            )
          ],
        ),
        drawer: MyDrawer(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: Column(
                children: [
                  Text("hey")
                ],
              ),
            ),
            IconButton(onPressed: () {

            }, icon:Icon(Icons.post_add))
          ],
        ));
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:socialmedia/auth/login_or_register.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  String username = "";
  String profilePhoto = "";

  @override
  void initState() {
    super.initState();
    _profileInfo();
  }

  _profileInfo() async {
    try {
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user != null) {
          print(user.uid);
          print(user.displayName);
          print(user.photoURL);
          setState(() {
            username = user.displayName.toString();
            profilePhoto = user.photoURL.toString();
          });
        }
      });
    } catch (e) {
      print("Error: $e");
      setState(() {
        username = "Paproker";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(
                child: Container(
                  padding: EdgeInsets.all(10.dg),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5.r),
                        child: SizedBox(
                          width: 50.w,
                          height: 50.h,
                          child: Image.network(
                            profilePhoto,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        username,
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.dg),
                child: Container(
                  padding: EdgeInsets.all(5.dg),
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(12.r)),
                  child: ListTile(
                    leading: Icon(Icons.home),
                    title: Text(
                      "Home",
                      style: TextStyle(fontSize: 16.sp),
                    ),
                  ),
                ),
              ),

              ///POST
              Padding(
                padding: EdgeInsets.all(8.dg),
                child: Container(
                  padding: EdgeInsets.all(5.dg),
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(12.r)),
                  child: ListTile(
                    leading: Icon(Icons.post_add),
                    title: Text(
                      "Post",
                      style: TextStyle(fontSize: 16.sp),
                    ),
                  ),
                ),
              ),

              ///PROFILE
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/user_profile');
                },
                child: Padding(
                  padding: EdgeInsets.all(8.dg),
                  child: Container(
                    padding: EdgeInsets.all(5.dg),
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(12.r)),
                    child: ListTile(
                      leading: Icon(Icons.person),
                      title: Text(
                        "Profile",
                        style: TextStyle(fontSize: 16.sp),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushNamed(context, "/login_or_reg");
            },
            child: Padding(
              padding: EdgeInsets.only(bottom: 15.h, left: 8.w, right: 8.w),
              child: Container(
                padding: EdgeInsets.all(5.dg),
                decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12.r)),
                child: ListTile(
                  leading: Icon(
                    Icons.logout_rounded,
                    color: Colors.red,
                  ),
                  title: Text(
                    "Logout",
                    style: TextStyle(fontSize: 16.sp),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

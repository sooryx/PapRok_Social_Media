import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:socialmedia/auth/login_or_register.dart';
import 'package:socialmedia/firebase_options.dart';
import 'package:socialmedia/pages/home_page.dart';
import 'package:socialmedia/pages/profile_page.dart';
import 'package:socialmedia/pages/register/register_page.dart';
import 'package:socialmedia/themes/dark_mode.dart';
import 'package:socialmedia/themes/light_mode.dart';

import 'onboarding_screen/onboarding_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    print("screen width is $screenWidth");
    print("screen height is $screenHeight");
    return ScreenUtilInit(
        designSize: const Size(392.72727272727275, 850.9090909090909),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            // home: RegisterPage(onTap: () {  },),
            home:  const OnBoardingScreen(),
            routes: {
              '/login_or_reg':(context) => const LoginOrRegister(),
              '/home':(context) => const Homepage(),
              '/user_profile':(context) => const ProfilePage()
            },
            theme: lightMode,
            darkTheme: darkMode,
          );
        });
  }
}

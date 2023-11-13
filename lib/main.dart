import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:socialmedia/auth/login_or_register.dart';
import 'package:socialmedia/firebase_options.dart';
import 'package:socialmedia/pages/home_page.dart';
import 'package:socialmedia/pages/onboarding_screen/onboarding_screen.dart';
import 'package:socialmedia/pages/profile_page.dart';
import 'package:socialmedia/pages/register/register_page.dart';
import 'package:socialmedia/pages/signin_with_google.dart';
import 'package:socialmedia/themes/dark_mode.dart';
import 'package:socialmedia/themes/light_mode.dart';


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
            home: AnimatedSplashScreen(
                backgroundColor: Theme.of(context).colorScheme.onSecondary,
                animationDuration: Duration(milliseconds: 1000),
                splash: Image.asset(filterQuality: FilterQuality.high,
                  'assets/images/logo-removebg-preview.png',
                  // height: 250.h,
                  // width: 250.w,
                  // fit: BoxFit.fitHeight,
                ),splashIconSize: 500.sp,
                splashTransition: SplashTransition.fadeTransition,
                // pageTransitionType: PageTransitionsBuild,
                nextScreen: const OnBoardingScreen()),
            routes: {
              '/login_or_reg': (context) => const LoginOrRegister(),
              '/home': (context) =>  Homepage(),
              '/user_profile': (context) => const ProfilePage(),
              '/_signin_google':(context) => const SigninWithGoogle()
            },
            theme: lightMode,
            darkTheme: darkMode,
          );
        });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:socialmedia/auth/login_or_register.dart';
import 'package:socialmedia/onboarding_screen/intro_pages/intropage_1.dart';
import 'package:socialmedia/onboarding_screen/intro_pages/intropage_2.dart';
import 'package:socialmedia/onboarding_screen/intro_pages/intropage_3.dart';
import 'package:socialmedia/pages/login_page.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController _controller = PageController();
  bool onLastpage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastpage = (index == 2);
              });
            },
            children: [
              Intro1(),
              Intro2(),
              Intro3(),
            ],
          ),
          Container(
            alignment: Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                    onTap: () {
                      _controller.jumpToPage(2);
                    },
                    child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 5.h, horizontal: 8.w),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40.r),
                            color: Colors.white54),
                        child: Text(
                          "Skip",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary),
                        ))),
                SmoothPageIndicator(
                  effect: ExpandingDotsEffect(),
                  controller: _controller,
                  count: 3,
                ),
                onLastpage
                    ? GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                              duration: Duration(microseconds: 500),
                              curve: Curves.easeIn);
                        },
                        child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginOrRegister()));
                            },
                            child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5.h, horizontal: 8.w),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40.r),
                                    color: Colors.white54),
                                child: Text(
                                  "Done",
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary),
                                ))))
                    : GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                              duration: Duration(microseconds: 5000),
                              curve: Curves.easeIn);
                        },
                        child: Text("Next"))
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:socialmedia/components/rounded%20Button.dart';
import '../../auth/firebase_auth/firebase_auth_services.dart';
import '../../components/my_textfields.dart';
import 'intro_reg.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;

  const RegisterPage({Key? key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  PageController _controller = PageController();

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  bool confirmpass = false;

  @override
  void dispose() {
    _controller.dispose();
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmpasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: [
          RegistrationFirstScreen(
            controller: _controller,
          ),
          Container(
            padding: EdgeInsets.all(10.dg),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Create Your Identity",
                  style: TextStyle(fontSize: 30.sp),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Container(
                  padding: EdgeInsets.all(10.dg),
                  child: Text(
                    "Give yourself a unique identity by choosing a cool username for your paprok account.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                MyTextField(
                  hintText: 'p@prock',
                  obscureText: false,
                  controller: usernameController,
                  icon: Icon(Icons.alternate_email_rounded),
                ),
                SizedBox(
                  height: 30.h,
                ),
                RoundButton(
                  icon: Icon(Icons.arrow_forward_ios_rounded),
                  onPressed: () {
                    _controller.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.bounceIn,
                    );
                  },
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10.dg),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Enter your E-Mail ID",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 30.sp,
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Container(
                  padding: EdgeInsets.all(10.dg),
                  child: Text(
                    "Awesome username! Now, share your email ID. \n We'll keep it safe, promise!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                MyTextField(
                  hintText: 'example@paprok.in',
                  obscureText: false,
                  controller: emailController,
                  icon: Icon(Icons.mail_outline_rounded),
                ),
                SizedBox(
                  height: 30.h,
                ),
                RoundButton(
                  icon: Icon(Icons.arrow_forward_ios_rounded),
                  onPressed: () {
                    _controller.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.bounceIn,
                    );
                  },
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10.dg),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Secure your account ",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 30.sp,
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Container(
                  padding: EdgeInsets.all(10.dg),
                  child: Text(
                    "Choose one that only you can crack! ",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                MyTextField(
                  hintText: 'Enter Password',
                  obscureText: false,
                  controller: passwordController,
                  icon: Icon(Icons.lock),
                ),
                SizedBox(
                  height: 20.h,
                ),
                MyTextField(
                  hintText: 'Confirm Password',
                  obscureText: false,
                  controller: confirmpasswordController,
                  icon: Icon(Icons.lock),
                ),
                SizedBox(height: 10.h,),
                confirmpass
                    ? Text("Password do not match with each other ",
                  style: TextStyle(color: Colors.red),)
                    : SizedBox(
                  height: 10.h,
                ),
                SizedBox(height: 10.h,),
                RoundButton(
                  icon: Icon(Icons.arrow_forward_ios_rounded),
                  onPressed: () {
                    if (passwordController.text ==
                        confirmpasswordController.text) {
                      _controller.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.bounceIn);
                    } else {
                      setState(() {
                        confirmpass = true;
                      });
                    }
                  },
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10.dg),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Account Created Successfully!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.sp,
                    color: Colors
                        .green, // Choose a color that fits your app's theme
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Container(
                  padding: EdgeInsets.all(10.dg),
                  child: Text(
                    "Welcome to Paprok! Your account is ready to roll. Start exploring and connecting with others.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                RoundButton(
                  icon: Icon(Icons.check),
                  onPressed: () {
                    _signUp();
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _signUp() async {
    String email = emailController.text;
    String password = passwordController.text;
    String username = usernameController.text;

    User? user = await _auth.signUpWithEmailAndPassword(
      email,
      password,
      username,
    );

    if (user != null) {
      _tohome();
    } else {
      print("Try again");
    }
  }

  void _tohome() {
    Fluttertoast.showToast(
      msg: "Welcome Onboard",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 12.0,
    );
    Navigator.pushNamed(context, '/home');
  }
}

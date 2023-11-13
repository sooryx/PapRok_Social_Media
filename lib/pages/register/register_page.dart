import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:socialmedia/components/rounded%20Button.dart';
import 'package:socialmedia/pages/register/bio.dart';
import 'package:socialmedia/pages/register/email_id.dart';
import 'package:socialmedia/pages/register/official_name_user.dart';
import 'package:socialmedia/pages/register/passwords.dart';
import 'package:socialmedia/pages/register/username.dart';
import '../../auth/firebase_auth/firebase_auth_services.dart';
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
  TextEditingController officialnameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  TextEditingController bioController = TextEditingController();


  @override
  void dispose() {
    _controller.dispose();
    officialnameController.dispose();
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

          ///INTRO_SCREEN
          RegistrationFirstScreen(
            controller: _controller,
          ),

          ///NAME_OF_THE_USER
          OfficialName(controller: _controller,
              officialnameController: officialnameController),


          ///USERNAME
          UserName(officialnameController: officialnameController,
              usernameController: usernameController,
              controller: _controller),

          ///MAIL_ID
          EmailID(controller: _controller,
              usernameController: usernameController,
              emailController: emailController),

          ///PASSWORD
          Passwords(passwordController: passwordController,
              controller: _controller,
              confirmpasswordController: confirmpasswordController),

          ///SHORT_BIO
          Bio(bioController: bioController, controller: _controller,),

          ///ALL_SET
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
                    Navigator.pushNamed(context, '/home');
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
    String officialname = officialnameController.text;
    String username = usernameController.text;
    String email = emailController.text;
    String password = passwordController.text;
    String bio = bioController.text;


    User? user = await _auth.signUpWithEmailAndPassword(
      officialname,
      username,
      email,
      password,
      bio,

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

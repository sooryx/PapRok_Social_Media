import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:socialmedia/auth/firebase_auth/firebase_auth_services.dart';
import 'package:socialmedia/components/my_button.dart';
import 'package:socialmedia/components/my_textfields.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;

  LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuthService _auth = FirebaseAuthService();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_outlined,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(25.dg),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.person,
                  size: 80.sp,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                SizedBox(
                  height: 25.h,
                ),
                Text(
                  "P A P R O K",
                  style: TextStyle(fontSize: 20.sp),
                ),
                SizedBox(
                  height: 50.h,
                ),
                MyTextField(
                    hintText: "Email",
                    obscureText: false,
                    controller: emailController),
                SizedBox(
                  height: 10.h,
                ),
                MyTextField(
                    hintText: "Password",
                    obscureText: true,
                    controller: passwordController),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Forgot Password",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary),
                    )
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                MyButton(
                  title: "Login",
                  onTap: _signIn,
                ),
                SizedBox(
                  height: 20.h,
                ),
                GestureDetector(
                  onTap: () {
                    _signInWithGoogle();
                  },
                  child: Container(
                    padding: EdgeInsets.all(25.dg),
                    decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(12.r)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(FontAwesomeIcons.google),
                        SizedBox(
                          width: 4.w,
                        ),
                        Text(
                          "Login with google",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16.sp),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account ?"),
                    GestureDetector(
                        onTap: widget.onTap,
                        child: Text(
                          " Register Here",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _signIn() async {
    String email = emailController.text;
    String password = passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    if (user != null) {
      print("Login Completed");
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Homepage()));
    } else {
      print("Try again");
    }
  }

  _signInWithGoogle() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();

    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
            idToken: googleSignInAuthentication.idToken,
            accessToken: googleSignInAuthentication.accessToken);

        await FirebaseAuth.instance.signInWithCredential(credential);

        _tohome();
      }
    } catch (e) {
      return Fluttertoast.showToast(
          msg: "Some error occured:  $e",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 12.0);
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
        fontSize: 12.0);
    Navigator.pushNamed(context, '/home');
  }
}

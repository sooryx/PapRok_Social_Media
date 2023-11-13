import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:socialmedia/auth/firebase_auth/firebase_auth_services.dart';
import 'package:socialmedia/components/my_button.dart';
import 'package:socialmedia/components/my_textfields.dart';

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
        elevation:0 ,
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [TextButton(onPressed: () {
          _skipasAnonymous();
        }, child: Text("Skip",style: TextStyle(color: Colors.white),))],
      ),
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
      _tohome();
    } else {
      print("Try again");
    }
  }

  _skipasAnonymous () async {
    try {
      final userCredential =
          await FirebaseAuth.instance.signInAnonymously();
      print("Signed in with temporary account.");
      _tohome();
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          print("Anonymous auth hasn't been enabled for this project.");
          break;
        default:
          print("Unknown error.");
      }
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

  void _toupdatebioOrPhoto() {
    Navigator.pushNamed(context, '/bio_uname');
  }
}

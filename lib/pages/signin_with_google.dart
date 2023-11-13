import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SigninWithGoogle extends StatefulWidget {
  const SigninWithGoogle({super.key});

  @override
  State<SigninWithGoogle> createState() => _SigninWithGoogleState();
}

class _SigninWithGoogleState extends State<SigninWithGoogle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation:0 ,
        backgroundColor: Theme.of(context).colorScheme.background,
        actions: [TextButton(onPressed: () {
          _skipasAnonymous();
        }, child: Text("Skip",style: TextStyle(color: Colors.white),))],
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: EdgeInsets.all(25.dg),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child:
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
                        "Continue with google",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16.sp),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 30.h,),
            Text("Or"),
            SizedBox(height: 30.h,),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/login_or_reg');
              },
              child: Container(
                padding: EdgeInsets.all(25.dg),
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onSurface,
                    borderRadius: BorderRadius.circular(12.r)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Signup Now",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.sp,color: Theme.of(context).colorScheme.primary),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
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
}

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:socialmedia/pages/register/bio.dart';
// import 'package:socialmedia/pages/register/upload_photo.dart';
// import 'package:socialmedia/pages/register/username.dart';
//
// import '../../auth/firebase_auth/firebase_auth_services.dart';
// import '../../components/rounded Button.dart';
//
// class BioandUsername extends StatefulWidget {
//   const BioandUsername({
//     super.key,
//   });
//
//   @override
//   State<BioandUsername> createState() => _BioandUsernameState();
// }
//
// class _BioandUsernameState extends State<BioandUsername> {
//   final FirebaseAuthService _auth = FirebaseAuthService();
//   PageController controller = PageController();
//   TextEditingController bioController = TextEditingController();
//   TextEditingController officialnameController = TextEditingController();
//   TextEditingController usernameController = TextEditingController();
//
//   void _fetchUsername() {
//     String username = FirebaseAuth.instance.currentUser!.displayName.toString();
//     setState(() {
//       officialnameController.text = username;
//     });
//   }
//
//   @override
//   void initState() {
//     _fetchUsername();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PageView(
//         controller: controller,
//         children: [
//           UserName(
//               officialnameController: officialnameController,
//               usernameController: usernameController,
//               controller: controller),
//           Bio(bioController: bioController, controller: controller),
//           Container(
//             padding: EdgeInsets.all(10.dg),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text(
//                   "Account Created Successfully!",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 30.sp,
//                     color: Colors
//                         .green, // Choose a color that fits your app's theme
//                   ),
//                 ),
//                 SizedBox(
//                   height: 30.h,
//                 ),
//                 Container(
//                   padding: EdgeInsets.all(10.dg),
//                   child: Text(
//                     "Welcome to Paprok! Your account is ready to roll. Start exploring and connecting with others.",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontWeight: FontWeight.normal,
//                       fontSize: 14.sp,
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 30.h,
//                 ),
//                 RoundButton(
//                   icon: Icon(Icons.check),
//                   onPressed: () {
//                     _signUp();
//                     Navigator.pushNamed(context, '/home');
//                   },
//                 )
//               ],
//             ),
//           ),
//
//         ],
//       ),
//     );
//   }
//   void _signUp() async {
//     String officialname = officialnameController.text;
//     String username = usernameController.text;
//     String email = FirebaseAuth.instance.currentUser!.email.toString();
//     String password = "null";
//     String bio = bioController.text;
//
//
//     User? user = await _auth.signUpWithEmailAndPassword(
//       officialname,
//       username,
//       email,
//       password,
//       bio,
//
//     );
//
//     if (user != null) {
//       _tohome();
//     } else {
//       print("Try again");
//     }
//   }
//   void _tohome() {
//     Fluttertoast.showToast(
//       msg: "Welcome Onboard",
//       toastLength: Toast.LENGTH_SHORT,
//       gravity: ToastGravity.BOTTOM,
//       timeInSecForIosWeb: 1,
//       backgroundColor: Colors.black,
//       textColor: Colors.white,
//       fontSize: 12.0,
//     );
//     Navigator.pushNamed(context, '/home');
//   }
// }

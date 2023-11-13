import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:socialmedia/components/rounded%20Button.dart';

class UploadPhoto extends StatefulWidget {
  final PageController controller;
  final XFile? selectedImage;

  const UploadPhoto({Key? key, required this.controller, this.selectedImage})
      : super(key: key);

  @override
  State<UploadPhoto> createState() => _UploadPhotoState();
}

class _UploadPhotoState extends State<UploadPhoto> {
  User? user = FirebaseAuth.instance.currentUser;

  void _removeImage() {
    // Handle image removal, if needed
  }

  Future<void> _pickImage(BuildContext context) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      try {
        // Upload image to Firebase Storage
        String imageUrl = await uploadImage(File(pickedImage.path));
        // Save imageUrl to your database or use it as needed
        print("Image uploaded successfully. URL: $imageUrl");
      } catch (e) {
        print("Error uploading image: $e");
        // Handle error as needed
      }
    }
  }

  Future<String> uploadImage(File imageFile) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      String imageName = user!.uid;

      UploadTask task = FirebaseStorage.instance
          .ref('user_images')
          .child(imageName)
          .putFile(imageFile);

      TaskSnapshot snapshot = await task.whenComplete(() => null);
      String imageUrl = await snapshot.ref.getDownloadURL();

      return imageUrl;
    } catch (e) {
      throw Exception("Failed to upload image: $e");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Upload Photo",
          style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 30.sp,
          ),
        ),
        SizedBox(height: 30.h),
        FloatingActionButton(
          onPressed: () => _pickImage(context),
          tooltip: 'Add Photo',
          child: const Icon(Icons.add),
        ),
        SizedBox(height: 15.h),
        if (widget.selectedImage != null)
          Container(
            padding: EdgeInsets.all(8.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.r),
              border: Border.all(width: 0.4.w, color: Colors.grey),
            ),
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Image.file(
                  File(widget.selectedImage!.path),
                  fit: BoxFit.cover,
                  width: 100.w,
                  height: 100.h,
                ),
                GestureDetector(
                  onTap: _removeImage,
                  child: Container(
                    padding: EdgeInsets.all(5.h),
                    color: Colors.red.withOpacity(0.8),
                    child: const Icon(Icons.close, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        SizedBox(height: 30.h,),
        RoundButton(
          icon: Icon(Icons.arrow_forward_ios_rounded),
          onPressed: () {
            widget.controller.nextPage(
                duration: Duration(milliseconds: 500),
                curve: Curves.bounceInOut);
          },
        )
      ],
    );
  }
}

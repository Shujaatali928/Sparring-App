// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import "dart:async";
import "dart:io";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:image_picker/image_picker.dart";
import "package:sparing_partners/components/profile_controller.dart";

// ignore: must_be_immutable
class ProfileImagePicker extends StatelessWidget {
  File? pickedfile;
  ImagePicker imagePicker = ImagePicker();
  ProfileController signUpController = Get.find();

  ProfileImagePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Obx(
          () => CircleAvatar(
            backgroundImage:
                signUpController.isProfileImagePathSet.value == true
                    ? FileImage(File(signUpController.profileImagePath.value))
                        as ImageProvider
                    : AssetImage("Assets/img/twoplayersshadow.png"),
            backgroundColor: Colors.white12,
            radius: 80,
          ),
        ),
        Positioned(
          bottom: 0,
          right: 5,
          child: SizedBox(
            height: 40,
            child: InkWell(
              child: CircleAvatar(
                backgroundColor: Colors.white,
                // maxRadius: 40,
                child: Icon(Icons.camera_enhance_rounded,
                    size: 30,
                    color:
                        Colors.redAccent // ICON THAT SHOWS BELOW CIRCLE SHAPE
                    ),
              ),
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.redAccent,
                    builder: (context) => bottomSheet(context));
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomSheet(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.20,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        children: [
          Text(
            "CHOOSE PROFILE PHOTO",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            // GALLERY
            children: [
              InkWell(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.image,
                      size: 40, // ICON SIZE
                      color: Colors.white,
                    ),
                    Text(
                      "Gallery",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'Poppins Medium',
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  choosePhoto(context, ImageSource.gallery);
                },
              ),
              SizedBox(
                width: 60,
              ),
              InkWell(
                // CAMERA
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.camera_alt_rounded,
                          size: 40,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    Text(
                      "Camera",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'Poppins Medium',
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  choosePhoto(context, ImageSource.camera);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

// THIS FUNCTION WILL OPEN GALLERY & CAMERA
  Future<void> choosePhoto(BuildContext context, ImageSource source) async {
    final pickedImage =
        await imagePicker.pickImage(source: source, imageQuality: 100);
    if (pickedImage == null) return;
    pickedfile = File(pickedImage.path);
    signUpController.setProfileImagePath(pickedfile!.path);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Profile picture updated',
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
        duration: Duration(seconds: 2), // Set the desired Snackbar duration
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
    Get.back();
    Timer(Duration(seconds: 3), () {
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
    });
  }
}

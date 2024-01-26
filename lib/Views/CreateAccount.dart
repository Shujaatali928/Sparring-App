import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sparing_partners/Views/HomePage.dart';
import 'package:sparing_partners/Views/Login.dart';
import 'package:sparing_partners/components/button.dart';
// import 'package:sparing_partners/components/CRadioButton.dart';
import 'package:sparing_partners/components/checkbox.dart';
import 'package:sparing_partners/components/colors.dart';
import 'package:sparing_partners/components/cus_text.dart';
// import 'package:sparing_partners/components/profile_image_picker.dart';
import 'package:sparing_partners/components/textfield.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    TextEditingController fullnametextcontroller = TextEditingController();
    TextEditingController emailtextcontroller = TextEditingController();
    TextEditingController passwordtextcontroller = TextEditingController();
    TextEditingController confirmpasstextcontroller = TextEditingController();
    TextEditingController locationtextcontroller = TextEditingController();

    // bool? radioButtonValue = false;

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const CTextBold(
            data: 'Register Here', color: appcolors.textColorwhite),
        backgroundColor: appcolors.orangeColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            // ProfileImagePicker(),
            CTextField(
                controller: fullnametextcontroller,
                labelText: "Full Name",
                onChanged: (value) {},
                hide: false),
            CTextField(
                controller: emailtextcontroller,
                labelText: "Email",
                onChanged: (value) {},
                hide: false),
            CTextField(
                controller: passwordtextcontroller,
                labelText: "Password",
                onChanged: (value) {},
                hide: true),
            CTextField(
                controller: confirmpasstextcontroller,
                labelText: "Confirm Password",
                onChanged: (value) {},
                hide: true),
            CTextField(
                controller: locationtextcontroller,
                labelText: "Location",
                onChanged: (value) {},
                hide: false),
            // Categories
            const Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: CTextBold(
                  data: "Select Categories:", color: appcolors.textColorblack),
            ),
            const Row(
              children: [
                Expanded(child: CcheckBox(label: 'Boxing')),
                Expanded(child: CcheckBox(label: 'Wrestling')),
              ],
            ),
            const Row(
              children: [
                Expanded(child: CcheckBox(label: 'MMA')),
                Expanded(child: CcheckBox(label: 'Jiu Jitsu')),
              ],
            ),
            const CcheckBox(label: 'Muay Thai'),

            // Experience Level
            const Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: CTextBold(
                  data: "Experience Level:", color: appcolors.textColorblack),
            ),
            const Row(
              children: [
                Expanded(child: CcheckBox(label: 'Beginner')),
                Expanded(child: CcheckBox(label: 'Advance')),
              ],
            ),
            const Row(
              children: [
                Expanded(child: CcheckBox(label: 'Intermediate')),
                Expanded(child: CcheckBox(label: 'Professional')),
              ],
            ),

            // Age
            const Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: CTextBold(
                  data: "Select Yor Age Group:",
                  color: appcolors.textColorblack),
            ),
            const Row(
              children: [
                Expanded(child: CcheckBox(label: '!8 & Under')),
                Expanded(child: CcheckBox(label: '30 - 39')),
              ],
            ),
            const Row(
              children: [
                Expanded(child: CcheckBox(label: '19 - 29')),
                Expanded(child: CcheckBox(label: '40 & Up')),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: CTextBold(data: "Sex:", color: appcolors.textColorblack),
            ),
            const Row(
              children: [
                Expanded(child: CcheckBox(label: 'Male')),
                Expanded(child: CcheckBox(label: 'Female')),
                Expanded(child: CcheckBox(label: 'Other')),
              ],
            ),
            Center(
                child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Button(
                  buttonname: "Create Account",
                  ontap: () {
                    // Fluttertoast.showToast(msg: "Showing Toast");
                    if (fullnametextcontroller.text.isEmpty ||
                        emailtextcontroller.text.isEmpty ||
                        passwordtextcontroller.text.isEmpty ||
                        confirmpasstextcontroller.text.isEmpty) {
                      Fluttertoast.showToast(
                          msg: "Please Fill All Fields",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: appcolors.orangeColor);
                    } else if (passwordtextcontroller !=
                        confirmpasstextcontroller) {
                      Fluttertoast.showToast(
                          msg: "Password Not Same",
                          backgroundColor: appcolors.orangeColor);
                    } else {
                      print('Creating Account');
                      FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: emailtextcontroller.text,
                              password: passwordtextcontroller.text)
                          .then((value) => {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const homepage()))
                              })
                          // ignore: body_might_complete_normally_catch_error
                          .catchError((error, stackTrace) {
                        print("Error: ${error.toString()}");
                      });
                    }
                  }),
            )),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                },
                child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already Register',
                        style: TextStyle(
                            color: appcolors.textColorblack,
                            fontSize: 20,
                            fontFamily: 'kanit',
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Login',
                        style: TextStyle(
                            color: appcolors.orangeColor,
                            fontSize: 20,
                            fontFamily: 'kanit',
                            fontWeight: FontWeight.bold),
                      )
                    ]),
              ),
            )
          ]),
        ),
      ),
    ));
  }
}

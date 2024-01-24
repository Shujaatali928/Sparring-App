import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
    TextEditingController _fullnametextcontroller = TextEditingController();
    TextEditingController _emailtextcontroller = TextEditingController();
    TextEditingController _passwordtextcontroller = TextEditingController();
    TextEditingController _confirmpasstextcontroller = TextEditingController();
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
                controller: _fullnametextcontroller,
                labelText: "Full Name",
                onChanged: (value) {
                  print('Full Name: $value');
                },
                hide: false),
            CTextField(
                controller: _emailtextcontroller,
                labelText: "Email",
                onChanged: (value) {
                  print('Email: $value');
                },
                hide: false),
            CTextField(
                controller: _passwordtextcontroller,
                labelText: "Password",
                onChanged: (value) {
                  print('Password: $value');
                },
                hide: false),
            CTextField(
                controller: _confirmpasstextcontroller,
                labelText: "Confirm Password",
                onChanged: (value) {
                  print('Confirm Password: $value');
                },
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
                    print('Creating Account');
                    FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: _emailtextcontroller.text,
                            password: _passwordtextcontroller.text)
                        .then((value) => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => homepage()))
                            })
                        // ignore: body_might_complete_normally_catch_error
                        .catchError((error, stackTrace) {
                      print("Error: ${error.toString()}");
                    });
                  }),
            )),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
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

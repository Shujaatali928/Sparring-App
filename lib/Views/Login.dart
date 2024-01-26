import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sparing_partners/Views/CreateAccount.dart';
import 'package:sparing_partners/Views/HomePage.dart';
import 'package:sparing_partners/components/button.dart';
import 'package:sparing_partners/components/colors.dart';
import 'package:sparing_partners/components/textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailtextcontroller = TextEditingController();
  final TextEditingController _passtextcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: appcolors.orangeColor,
        title: const Text(
          'Login To Continue',
          style: TextStyle(
              fontFamily: 'kanit',
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: appcolors.textColorwhite),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
                height: 200,
                child: Image(
                    image: AssetImage('lib/Asset/img/twoplayersshadow.png'))),
            CTextField(
              controller: _emailtextcontroller,
              hide: false,
              labelText: "User Name",
              onChanged: (value) {
                setState(() {});
              },
            ),
            CTextField(
              controller: _passtextcontroller,
              hide: true,
              labelText: "Password",
              onChanged: (value) {},
            ),
            Button(
              buttonname: "Login",
              ontap: () {
                if (_emailtextcontroller.text.isEmpty ||
                    _passtextcontroller.text.isEmpty) {
                  Fluttertoast.showToast(
                      msg: "Fill All Field Or Don't Have Account? Signup Below",
                      backgroundColor: appcolors.orangeColor);
                } else if (_emailtextcontroller.text !=
                        "shujaat.ali928@gmail.com" ||
                    _passtextcontroller.text != "shujaat") {
                  Fluttertoast.showToast(
                      msg: "Invalid Email Or Password",
                      backgroundColor: appcolors.orangeColor);
                } else {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const homepage()));
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const SignUp()));
                },
                child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Dont Have Account?',
                        style: TextStyle(
                            color: appcolors.textColorblack,
                            fontSize: 20,
                            fontFamily: 'kanit',
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Create Account',
                        style: TextStyle(
                            color: appcolors.orangeColor,
                            fontSize: 20,
                            fontFamily: 'kanit',
                            fontWeight: FontWeight.bold),
                      )
                    ]),
              ),
            )
          ],
        ),
      ),
    ));
  }
}

import 'package:flutter/material.dart';
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
  TextEditingController _emailtextcontroller = TextEditingController();
  TextEditingController _passtextcontroller = TextEditingController();
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
                print('Username: $value');
              },
            ),
            CTextField(
              controller: _passtextcontroller,
              hide: true,
              labelText: "Password",
              onChanged: (value) {
                print('Password: $value');
              },
            ),
            Button(
              buttonname: "Login",
              ontap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => homepage()));
              },
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUp()));
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

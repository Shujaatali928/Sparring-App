import 'package:flutter/material.dart';
import 'package:sparing_partners/Views/Login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Simulate a delay before navigating to the next screen
    Future.delayed(
      const Duration(seconds: 5),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  const LoginPage()), // Replace HomeScreen with the screen you want to navigate to
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image(image: AssetImage('lib/Asset/img/image1.png')),
              SizedBox(
                height: 60,
              ),
              Image(image: AssetImage('lib/Asset/img/twoplayersshadow.png')),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}

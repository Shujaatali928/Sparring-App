import 'package:flutter/material.dart';
import 'package:sparing_partners/components/splashservices.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  splashservices splashscreen = splashservices();
  @override
  void initState() {
    super.initState();
    splashscreen.isLogin(context);
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

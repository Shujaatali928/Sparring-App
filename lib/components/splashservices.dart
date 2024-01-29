import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sparing_partners/Views/HomePage.dart';
import 'package:sparing_partners/Views/Login.dart';

class splashservices {
  void isLogin(BuildContext context) {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    if (user != null) {
      Timer(
          const Duration(seconds: 5),
          () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const homepage()),
              ));
    } else {
      Timer(
          const Duration(seconds: 5),
          () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              ));
    }
  }
}

import 'package:flutter/material.dart';
import 'package:sparing_partners/Views/CreateAccount.dart';
import 'package:sparing_partners/Views/HomePage.dart';
import 'package:sparing_partners/Views/Login.dart';
import 'package:sparing_partners/Views/SplashScreen.dart';
import 'RoutesName.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splash:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashScreen());
      case RouteName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginPage());
      case RouteName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const homepage());
      case RouteName.signup:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SignUp());

      default:
        return MaterialPageRoute(
          builder: (_) {
            return const Scaffold(
              body: Center(
                child: Text('No Route Found'),
              ),
            );
          },
        );
    }
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sparing_partners/routes/RoutesName.dart';

import 'routes/Routes.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // try {
  //   print("Initializing Firebase");
  //   await Firebase.initializeApp();
  // } catch (e) {
  //   print("Error initializing Firebase: $e");
  // }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteName.splash,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}

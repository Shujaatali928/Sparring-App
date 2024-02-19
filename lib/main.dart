import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sparing_partners/components/profile_controller.dart';
import 'package:sparing_partners/firebase_options.dart';
import 'package:sparing_partners/routes/RoutesName.dart';
import 'package:get/get.dart';

import 'routes/Routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Get.putAsync(() => ProfileController().init());

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put(ProfileController());
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

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:health/auth_controller.dart';
import 'package:health/localeString.dart';
import 'package:health/pages/login_page.dart';
import 'package:get/get.dart ';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => Get.put(AuthController()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: LocalString(),
      locale: const Locale('en', 'US'),
      theme: ThemeData(
        colorScheme: const ColorScheme.light(),
      ),
      home: const LoginPage(),
    );
  }
}

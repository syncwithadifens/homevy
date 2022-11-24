import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:homevy/theme/styles.dart';
import 'package:homevy/ui/pages/splash_page.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Homevy',
      theme: ThemeData(primaryColor: secondaryColor),
      home: const SplashPage(),
    );
  }
}

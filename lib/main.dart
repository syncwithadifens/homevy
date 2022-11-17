import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:homevy/ui/pages/splash_page.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
<<<<<<< HEAD
      home:SplashPage(),
=======
      home: SplashPage(),
>>>>>>> c126b0e98bee0d08274088988afca0e308d126df
    );
  }
}

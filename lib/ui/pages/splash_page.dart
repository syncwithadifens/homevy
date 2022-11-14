import 'package:flutter/material.dart';
import 'package:homevy/controllers/auth_controller.dart';
import 'package:homevy/theme/styles.dart';
import 'package:get/get.dart';
import 'package:homevy/ui/pages/home_page.dart';

import 'login_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    // NOTE: Mengecek apakah user pernah login atau belum
    final authController = Get.put(AuthController());
    Future.delayed(
      const Duration(seconds: 2),
      () => Get.off(() => authController.userData != null
          ? const HomePage()
          : const LoginPage()),
    );
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'HOMEVY',
              style: titleStyle.copyWith(fontSize: 48),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                'your perfect room',
                style: taglineStyle,
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:homevy/theme/styles.dart';
import 'package:get/get.dart';

import 'login_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 3),
      () => Get.off(() => const LoginPage()),
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

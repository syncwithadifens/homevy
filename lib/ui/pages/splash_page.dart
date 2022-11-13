import 'package:flutter/material.dart';
import 'package:homevy/theme/styles.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
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

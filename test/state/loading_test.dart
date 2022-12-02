import 'package:flutter_test/flutter_test.dart';
import 'package:homevy/controllers/auth_controller.dart';

void main() {
  AuthController authController = AuthController();
  test(
    'cek status awal loading',
    () {
      expect(authController.isLoading.value, equals(false));
    },
  );
}

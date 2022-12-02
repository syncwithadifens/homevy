import 'package:flutter_test/flutter_test.dart';
import 'package:homevy/models/user_model.dart';
import 'package:homevy/services/auth_service.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';

// Generate a MockClient using the Mockito package.
// Create new instances of this class in each test.
@GenerateMocks([http.Client])
void main() {
  late AuthService authService;
  setUp(
    () {
      authService = AuthService();
    },
  );

  test(
    'Successfully logged in user',
    () async {
      expect(await authService.signInWithEmail('syncwadifens', '12345678'),
          isA<UserModel>());
    },
  );
}

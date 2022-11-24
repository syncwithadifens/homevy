import 'package:homevy/controllers/auth_controller.dart';
import 'package:homevy/models/review_model.dart';
import 'package:homevy/services/auth_service.dart';
import 'package:http/http.dart' as http;

class ReviewService {
  final apiUrl = AuthService.apiUrl;

  Future<ReviewModel> getAllReview(int productId) async {
    final response = await http.get(Uri.parse('$apiUrl/api/review/$productId'),
        headers: {'Authorization': 'Bearer ${AuthController.token}'});
    if (response.statusCode == 200) {
      return reviewModelFromJson(response.body);
    } else {
      throw Exception('Gagal mendapat data');
    }
  }
}

import 'dart:convert';
import 'dart:io';

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

  Future<String> addUserReview(
      int productId, String rate, String review, File img) async {
    final request = http.MultipartRequest(
        'POST', Uri.parse('$apiUrl/api/review/$productId'))
      ..fields.addAll({'star': rate, 'review': review})
      ..headers.addAll({'Authorization': 'Bearer ${AuthController.token}'})
      ..files.add(await http.MultipartFile.fromPath('image', img.path));

    final response = await http.Response.fromStream(await request.send());
    if (response.statusCode == 200) {
      final res = createReviewModelFromJson(response.body);
      return res.info;
    } else {
      final res = ErrorReviewModel.fromJson(jsonDecode(response.body));
      return res.info;
    }
  }
}

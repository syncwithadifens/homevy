import 'dart:convert';

import 'package:homevy/controllers/auth_controller.dart';
import 'package:homevy/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthService {
  static const apiUrl = 'https://api1.sib3.nurulfikri.com';

  Future<UserModel> signInWithEmail(String email, String password) async {
    final response = await http.post(Uri.parse('$apiUrl/api/login'), body: {
      'email': email,
      'password': password,
    });
    if (response.statusCode == 200 || response.statusCode == 400) {
      return UserModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Gagal mendapat data');
    }
  }

  Future<UserModel> signUpWithEmail(String email, String password,
      String passwordConfirm, String name, String phone) async {
    var response = await http.post(Uri.parse('$apiUrl/api/register'), body: {
      'name': name,
      'email': email,
      'handphone': phone,
      'password': password,
      'password_confirmation': passwordConfirm
    });
    if (response.statusCode == 200 || response.statusCode == 400) {
      return UserModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Gagal mendapat data');
    }
  }

  Future<String> signOut() async {
    final response = await http.post(Uri.parse('$apiUrl/api/logout'),
        headers: {'Authorization': 'Bearer ${AuthController.token}'});
    if (response.statusCode == 200) {
      return 'Berhasil Logout';
    } else {
      throw Exception('Gagal Logout');
    }
  }
}

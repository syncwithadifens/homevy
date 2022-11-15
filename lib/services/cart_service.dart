import 'package:homevy/controllers/auth_controller.dart';
import 'package:homevy/models/cart_model.dart';
import 'package:http/http.dart' as http;
import 'auth_service.dart';

class CartService {
  final apiUrl = AuthService.apiUrl;

  Future<CartModel> getFavoriteItem() async {
    final response = await http.get(Uri.parse('$apiUrl/api/keranjang'),
        headers: {'Authorization': 'Bearer ${AuthController.token}'});
    if (response.statusCode == 200) {
      return cartModelFromJson(response.body);
    } else {
      throw Exception('Gagal mendapat data');
    }
  }
}

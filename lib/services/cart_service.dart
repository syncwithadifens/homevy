import 'package:homevy/controllers/auth_controller.dart';
import 'package:homevy/models/cart_model.dart';
import 'package:http/http.dart' as http;
import 'auth_service.dart';

class CartService {
  final apiUrl = AuthService.apiUrl;

  Future<CartModel> getCartItem() async {
    final response = await http.get(Uri.parse('$apiUrl/api/keranjang'),
        headers: {'Authorization': 'Bearer ${AuthController.token}'});
    if (response.statusCode == 200) {
      return cartModelFromJson(response.body);
    } else {
      throw Exception('Gagal mendapat data');
    }
  }

  Future<String> addCartItem(String productId, String quantity) async {
    final response = await http.post(Uri.parse('$apiUrl/api/keranjang'),
        headers: {'Authorization': 'Bearer ${AuthController.token}'},
        body: {'product_id': productId, 'qty': quantity});
    if (response.statusCode == 200) {
      return 'Success';
    } else {
      throw Exception('Gagal mendapat data');
    }
  }
}

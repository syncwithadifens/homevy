import 'package:homevy/controllers/auth_controller.dart';
import 'package:homevy/models/wishlist_model.dart';
import 'package:homevy/services/auth_service.dart';
import 'package:http/http.dart' as http;

class WishlistService {
  final apiUrl = AuthService.apiUrl;

  Future<WishlistModel> getFavoriteItem() async {
    final response = await http.get(Uri.parse('$apiUrl/api/wishlist'),
        headers: {'Authorization': 'Bearer ${AuthController.token}'});
    if (response.statusCode == 200) {
      return wishlistModelFromJson(response.body);
    } else {
      throw Exception('Gagal mendapat data');
    }
  }

  Future<String> addToFavorite(String productId) async {
    final response = await http.post(Uri.parse('$apiUrl/api/wishlist'),
        headers: {'Authorization': 'Bearer ${AuthController.token}'},
        body: {'product_id': productId});
    if (response.statusCode == 200) {
      return 'Success';
    } else {
      return 'Gagal';
    }
  }
}

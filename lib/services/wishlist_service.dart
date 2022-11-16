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
      print(AuthController.token);

      throw Exception('Gagal mendapat data');
    }
  }
}

import 'package:homevy/models/product_model.dart';
import 'package:homevy/services/auth_service.dart';

class ProductService {
  final apiUrl = AuthService.apiUrl;

  Future<ProductModel> getProductByCategory(String? token, var client) async {
    final response = await client.get(Uri.parse('$apiUrl/api/category/22'),
        headers: {'Authorization': 'Bearer $token'});
    if (response.statusCode == 200) {
      return productModelFromJson(response.body);
    } else {
      throw Exception('Gagal mendapat data');
    }
  }
}

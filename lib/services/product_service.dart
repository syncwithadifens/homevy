import 'package:homevy/controllers/auth_controller.dart';
import 'package:homevy/models/product_model.dart';
import 'package:homevy/services/auth_service.dart';
import 'package:http/http.dart' as http;

class ProductService {
  final apiUrl = AuthService.apiUrl;

  Future<ProductModel> getProductByCategory() async {
    final response = await http.get(Uri.parse('$apiUrl/api/category/23'),
        headers: {'Authorization': 'Bearer ${AuthController.token}'});
    if (response.statusCode == 200) {
      return productModelFromJson(response.body);
    } else {
      throw Exception('Gagal mendapat data');
    }
  }
}

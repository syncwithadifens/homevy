import 'package:homevy/controllers/auth_controller.dart';
import 'package:homevy/models/transaction_model.dart';
import 'package:http/http.dart' as http;
import 'auth_service.dart';

class TransactionService {
  final apiUrl = AuthService.apiUrl;

  Future<TransactionModel> getFavoriteItem() async {
    final response = await http.get(Uri.parse('$apiUrl/api/transaksi'),
        headers: {'Authorization': 'Bearer ${AuthController.token}'});
    if (response.statusCode == 200) {
      return transactionModelFromJson(response.body);
    } else {
      throw Exception('Gagal mendapat data');
    }
  }
}

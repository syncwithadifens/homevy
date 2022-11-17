import 'package:homevy/controllers/auth_controller.dart';
import 'package:homevy/models/transaction_model.dart';
import 'package:http/http.dart' as http;
import 'auth_service.dart';

class TransactionService {
  final apiUrl = AuthService.apiUrl;

  Future<TransactionModel> getAllTransaction() async {
    final response = await http.get(Uri.parse('$apiUrl/api/transaksi'),
        headers: {'Authorization': 'Bearer ${AuthController.token}'});
    if (response.statusCode == 200) {
      return transactionModelFromJson(response.body);
    } else {
      throw Exception('Gagal mendapat data');
    }
  }

  Future<String> createTransactionOrder(String address) async {
    final response = await http.post(Uri.parse('$apiUrl/api/transaksi'),
        headers: {'Authorization': 'Bearer ${AuthController.token}'},
        body: {'alamat': address});
    if (response.statusCode == 200) {
      return 'Success';
    } else {
      return 'Gagal';
    }
  }
}

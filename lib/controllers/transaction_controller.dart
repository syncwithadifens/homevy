import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homevy/models/transaction_model.dart';
import 'package:homevy/services/transaction_service.dart';

class TransactionController extends GetxController {
  TransactionService transactionService = TransactionService();
  TransactionModel? transactionList;
  final isLoading = false.obs;
  final shippingAddress = TextEditingController();

  Future<void> getTransaction() async {
    try {
      isLoading.value = true;
      transactionList = await transactionService.getAllTransaction();
      if (transactionList!.info == 'Membuat Keranjang berhasil') {
        isLoading.value = false;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> createTransaction() async {
    if (shippingAddress.text.isNotEmpty) {
      final response =
          await transactionService.createTransactionOrder(shippingAddress.text);
      if (response == 'Success') {
        Get.snackbar('Success', 'Order success',
            snackPosition: SnackPosition.BOTTOM,
            margin: const EdgeInsets.only(bottom: 5),
            backgroundColor: Colors.green);
      }
    } else {
      Get.snackbar('Error', 'Shipping address is required',
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.only(bottom: 5),
          backgroundColor: Colors.red);
    }
  }

  @override
  void onInit() {
    super.onInit();
    getTransaction();
  }
}

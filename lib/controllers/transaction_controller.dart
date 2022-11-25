import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homevy/models/transaction_model.dart';
import 'package:homevy/services/transaction_service.dart';
import 'package:homevy/theme/styles.dart';
import 'package:homevy/ui/pages/home_page.dart';
import 'package:homevy/ui/pages/transaction_page.dart';

class TransactionController extends GetxController {
  TransactionService transactionService = TransactionService();
  TransactionModel? transactionList;
  final isLoading = false.obs;
  final shippingAddress = TextEditingController();

  Future<void> getTransaction() async {
    try {
      isLoading.value = true;
      transactionList = await transactionService.getAllTransaction();
      if (transactionList!.info == 'Mengambil list transaksi berhasil') {
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
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 2));
        Future.delayed(
            const Duration(seconds: 3),
            () => Get.defaultDialog(
                title: 'Congratulations',
                content: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 15),
                      child: Text('Give rate product now?'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () => Get.off(() => const HomePage()),
                          child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: bgColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Text('Maybe later')),
                        ),
                        GestureDetector(
                          onTap: () => Get.off(() => const TransactionPage())!
                              .then((value) => getTransaction()),
                          child: Container(
                              margin: const EdgeInsets.only(left: 8),
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Text('Sure')),
                        )
                      ],
                    ),
                  ],
                )));
      } else {
        Get.snackbar('Error', 'Cart item is empty',
            snackPosition: SnackPosition.BOTTOM,
            margin: const EdgeInsets.only(bottom: 5),
            backgroundColor: Colors.red);
        Future.delayed(
          const Duration(seconds: 3),
          () => Get.off(() => const HomePage()),
        );
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

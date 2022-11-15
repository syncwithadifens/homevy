import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homevy/controllers/auth_controller.dart';
import 'package:homevy/models/product_model.dart';
import 'package:homevy/services/product_service.dart';
import 'package:http/http.dart' as http;

class ProductController extends GetxController {
  ProductService productService = ProductService();
  late ProductModel productData;
  final isLoading = false.obs;

  Future<void> getProduct() async {
    try {
      isLoading.value = true;
      productData = await productService.getProductByCategory(
          AuthController.token, http.Client);
      if (productData.info == 'Category Berhasil Diambil') {
        isLoading.value = false;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void onInit() {
    super.onInit();
    getProduct();
  }
}

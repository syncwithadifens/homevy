import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homevy/models/product_model.dart';
import 'package:homevy/services/product_service.dart';

class ProductController extends GetxController {
  ProductService productService = ProductService();
  ProductModel? productData;
  final isLoading = false.obs;

  Future<void> getProduct() async {
    try {
      isLoading.value = true;
      final res = await productService.getProductByCategory();
      if (res.info == 'Category Berhasil Diambil') {
        isLoading.value = false;
        productData = res;
      }
    } catch (e) {
      isLoading.value = false;
      debugPrint(e.toString());
    }
  }

  @override
  void onInit() {
    super.onInit();
    getProduct();
  }
}

import 'package:get/get.dart';
import 'package:homevy/models/cart_model.dart';
import 'package:homevy/services/cart_service.dart';
import 'package:flutter/material.dart';
import 'package:homevy/ui/pages/cart_page.dart';

class CartController extends GetxController {
  CartService cartService = CartService();
  CartModel? cartData;
  final isLoading = false.obs;
  final quantity = 1.obs;

  Future<void> getCart() async {
    try {
      isLoading.value = true;
      cartData = await cartService.getCartItem();
      if (cartData!.info == 'Keranjang Berhasil Diambil') {
        isLoading.value = false;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> addToCart(int productId) async {
    try {
      final response =
          await cartService.addCartItem(productId.toString(), '$quantity');
      if (response == 'Success') {
        Get.to(() => const CartPage());
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void increaseQuantity() {
    quantity.value++;
  }

  void decreaseQuantity() {
    if (quantity.value > 1) {
      quantity.value--;
    }
  }

  @override
  void onInit() {
    super.onInit();
    getCart();
  }
}

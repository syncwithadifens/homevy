import 'package:get/get.dart';
import 'package:homevy/models/cart_model.dart';
import 'package:homevy/services/cart_service.dart';
import 'package:flutter/material.dart';

class CartController extends GetxController {
  CartService cartService = CartService();
  CartModel? cartData;
  final isLoading = false.obs;
  final existQty = {}.obs;
  final newQty = 1.obs;
  final total = 0.obs;

  Future<void> getCart() async {
    try {
      isLoading.value = true;
      cartData = await cartService.getCartItem();
      if (cartData!.info == 'Keranjang Berhasil Diambil') {
        isLoading.value = false;
        List listPrice = [];
        if (cartData!.data.isNotEmpty) {
          for (var i = 0; i < cartData!.data.length; i++) {
            final int subtotal;
            subtotal = cartData!.data[i].product.harga * cartData!.data[i].qty;
            listPrice.add(subtotal);
            existQty[cartData!.data[i].productId] = cartData!.data[i].qty;
          }
          total.value = listPrice.reduce((value, element) => value + element);
        }
      }
    } catch (e) {
      isLoading.value = false;
      debugPrint(e.toString());
    }
  }

  Future<void> addToCart(int productId, String stat) async {
    try {
      final response = await cartService.addCartItem('$productId',
          '${stat == 'exist' ? existQty[productId] : newQty.value}');
      if (response == 'Success') {
        getCart();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> removeFromCart(int cartId) async {
    try {
      final response = await cartService.removeCartItem(cartId);
      if (response == 'Success') {
        total.value = 0;
        getCart();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void increaseQuantity(int productId) {
    if (existQty.containsKey(productId)) {
      existQty[productId]++;
      addToCart(productId, 'exist');
    } else {
      newQty.value++;
    }
  }

  void decreaseQuantity(int productId) {
    if (existQty.containsKey(productId)) {
      if (existQty[productId] > 1) {
        existQty[productId]--;
        addToCart(productId, 'exist');
      }
    } else if (newQty.value > 1) {
      newQty.value--;
    }
  }

  @override
  void onInit() {
    super.onInit();
    getCart();
  }
}

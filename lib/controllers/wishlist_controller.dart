import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homevy/models/wishlist_model.dart';
import 'package:homevy/services/wishlist_service.dart';

class WishlistController extends GetxController {
  WishlistService wishlistService = WishlistService();
  WishlistModel? favoriteList;
  final isLoading = false.obs;
  final favoriteItem = {}.obs;

  Future<void> getWishlist() async {
    try {
      isLoading.value = true;
      favoriteList = await wishlistService.getFavoriteItem();
      if (favoriteList!.info == 'Data Berhasil Diambil') {
        isLoading.value = false;
        for (var i = 0; i < favoriteList!.data.length; i++) {
          favoriteItem[favoriteList!.data[i].productId] =
              favoriteList!.data[i].id;
        }
      }
    } catch (e) {
      isLoading.value = false;
      debugPrint(e.toString());
    }
  }

  Future<void> toggleFavorite(int productId) async {
    final isExist = favoriteItem.containsKey(productId);
    if (isExist) {
      int wishlistId = favoriteItem[productId];
      final response = await wishlistService.removeFromFavorite('$wishlistId');
      if (response == 'Success') {
        favoriteItem.remove(productId);
      } else {
        debugPrint('Gagal hapus favorite');
      }
    } else {
      final response = await wishlistService.addToFavorite('$productId');
      if (response.info == 'Wishlist berhasil di input') {
        favoriteItem[productId] = response.data!.id;
      } else {
        debugPrint('Gagal tambah favorite');
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
    getWishlist();
  }
}

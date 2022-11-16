import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homevy/models/wishlist_model.dart';
import 'package:homevy/services/wishlist_service.dart';

class WishlistController extends GetxController {
  WishlistService wishlistService = WishlistService();
  WishlistModel? favoriteList;
  final isLoading = false.obs;

  Future<void> getWishlist() async {
    try {
      isLoading.value = true;
      favoriteList = await wishlistService.getFavoriteItem();
      if (favoriteList!.info == 'Data Berhasil Diambil') {
        isLoading.value = false;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void onInit() {
    super.onInit();
    getWishlist();
  }
}

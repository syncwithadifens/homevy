import 'package:flutter_test/flutter_test.dart';
import 'package:homevy/controllers/wishlist_controller.dart';

void main() {
  WishlistController wishlistController = WishlistController();
  test(
    'add product to wishlist',
    () {
      int productId = 17;
      int wishlistId = 1;
      wishlistController.favoriteItem[productId] = wishlistId;
      expect(wishlistController.favoriteItem, contains(17));
    },
  );
}

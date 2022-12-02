import 'package:flutter_test/flutter_test.dart';
import 'package:homevy/controllers/wishlist_controller.dart';

void main() {
  WishlistController wishlistController = WishlistController();
  test(
    'remove product from wishlist',
    () {
      wishlistController.favoriteItem.addAll({22: 60, 23: 61, 24: 62});
      wishlistController.favoriteItem.remove(22);
      expect(wishlistController.favoriteItem.length, equals(2));
    },
  );
}

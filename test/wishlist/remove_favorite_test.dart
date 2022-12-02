import 'package:flutter_test/flutter_test.dart';

void main() {
  Map favoriteItem = {1: 20, 2: 30, 3: 15, 4: 8};
  test(
    'remove product from wishlist',
    () {
      favoriteItem.remove(2);
      expect(favoriteItem.length, equals(3));
    },
  );
}

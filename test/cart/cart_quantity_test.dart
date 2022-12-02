import 'package:flutter_test/flutter_test.dart';
import 'package:homevy/controllers/cart_controller.dart';

void main() {
  CartController cartController = CartController();

  group(
    'Product quantity',
    () {
      test(
        'increased',
        () {
          cartController.increaseQuantity(20);
          expect(cartController.newQty.value, isNot(1));
        },
      );
      test(
        'decreased',
        () {
          cartController.decreaseQuantity(20);
          expect(cartController.newQty.value, equals(1));
        },
      );
    },
  );
}

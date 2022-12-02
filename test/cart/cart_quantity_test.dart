import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:homevy/controllers/cart_controller.dart';

void main() {
  CartController cartController = CartController();

  group(
    'Product quantity',
    () {
      debugPrint('Quantity: ${cartController.quantity.value}');

      test(
        'increased',
        () {
          cartController.increaseQuantity();
          expect(cartController.quantity.value, isNot(0));
        },
      );
      test(
        'decreased',
        () {
          cartController.decreaseQuantity();
          expect(cartController.quantity.value, equals(1));
        },
      );
    },
  );
}

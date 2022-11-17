import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homevy/controllers/cart_controller.dart';
import 'package:homevy/controllers/transaction_controller.dart';
import 'package:homevy/theme/styles.dart';
import 'package:homevy/ui/widgets/product_cart.dart';
import 'package:intl/intl.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();
    final transactionController = Get.put(TransactionController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(0, 5),
                              spreadRadius: 1,
                              blurRadius: 3,
                              color: greyColor)
                        ]),
                    child: IconButton(
                        padding: EdgeInsets.zero,
                        iconSize: 30,
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(
                          Icons.chevron_left,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 25),
                    child: Text(
                      'Checkout',
                      style: subtitleStyle.copyWith(
                          fontSize: 22, fontWeight: FontWeight.w700),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: Text('Shipping address',
                  style: subtitleStyle.copyWith(fontWeight: FontWeight.w700)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: transactionController.shippingAddress,
                keyboardType: TextInputType.streetAddress,
                maxLines: 4,
                textAlign: TextAlign.justify,
                decoration: InputDecoration(
                  hintText: 'Your address',
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  filled: true,
                  fillColor: lightGreyColor,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Payment',
                    style: subtitleStyle.copyWith(fontWeight: FontWeight.w700),
                  ),
                  Obx(() => cartController.cartData!.data.isEmpty
                      ? Text('0',
                          style: subtitleStyle.copyWith(
                              color: primaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w700))
                      : Text(
                          NumberFormat.currency(
                                  locale: 'id', symbol: 'Rp', decimalDigits: 2)
                              .format(cartController.total.value),
                          style: subtitleStyle.copyWith(
                              color: primaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w700),
                        )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Text('Payment Method',
                  style: subtitleStyle.copyWith(fontWeight: FontWeight.w700)),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: whiteColor, borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Select payment method'),
                  DropdownButton(
                    items: const [
                      DropdownMenuItem(child: Text('BNI')),
                    ],
                    onChanged: (value) {},
                  )
                ],
              ),
            ),
            Obx(() => cartController.isLoading.value
                ? const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : cartController.cartData!.data.isEmpty
                    ? const Expanded(
                        child: Center(child: Text('No item in cart')))
                    : Expanded(
                        child: ListView.builder(
                          itemCount: cartController.cartData!.data.length,
                          itemBuilder: (context, index) {
                            return ProductCart(
                              cardList: cartController.cartData!.data[index],
                            );
                          },
                        ),
                      )),
            GestureDetector(
              onTap: () {
                transactionController.createTransaction();
              },
              child: Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                width: Get.width,
                decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    'Create Order',
                    style: subtitleStyle.copyWith(color: whiteColor),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

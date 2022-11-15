import 'package:flutter/material.dart';
import 'package:homevy/theme/styles.dart';
import 'package:homevy/ui/widgets/product_cart.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe7e7e7),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                      padding: EdgeInsets.zero,
                      iconSize: 30,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.chevron_left,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 25),
                  child: Text(
                    'Shopping Cart',
                    style: subtitleStyle.copyWith(
                        fontSize: 22, fontWeight: FontWeight.w700),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 200),
                  child: ListView.builder(
                    itemCount: 7,
                    itemBuilder: (context, index) {
                      return const ProductCart();
                    },
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: Get.width,
                    height: 200,
                    decoration: BoxDecoration(
                        color: whiteColor,
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(-5, -5),
                              spreadRadius: 1,
                              blurRadius: 15,
                              color: greyColor),
                        ],
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15))),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Order Information',
                            style: subtitleStyle.copyWith(
                                fontWeight: FontWeight.w700),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Subtotal',
                                  style: subtitleStyle.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: greyColor),
                                ),
                                Text(
                                  'Rp3.500.000',
                                  style: subtitleStyle.copyWith(
                                      color: primaryColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Shiping Cost',
                                  style: subtitleStyle.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: greyColor),
                                ),
                                Text(
                                  'Rp500.000',
                                  style: subtitleStyle.copyWith(
                                      color: primaryColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: secondaryColor,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total Payment',
                                style: subtitleStyle.copyWith(
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                'Rp4.000.000',
                                style: subtitleStyle.copyWith(
                                    color: primaryColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Container(
                            height: 40,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            width: Get.width,
                            decoration: BoxDecoration(
                                color: secondaryColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Proceed to checkout',
                                  style:
                                      subtitleStyle.copyWith(color: whiteColor),
                                ),
                                Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      color: whiteColor,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: const Icon(Icons.chevron_right),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}

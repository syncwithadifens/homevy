import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homevy/controllers/cart_controller.dart';
import 'package:homevy/models/cart_model.dart';
import 'package:homevy/theme/styles.dart';
import 'package:intl/intl.dart';

class ProductCart extends StatelessWidget {
  const ProductCart({Key? key, required this.cardList}) : super(key: key);
  final Datum cardList;
  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
      height: 100,
      width: Get.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: whiteColor),
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            children: [
              Container(
                height: 90,
                width: 90,
                margin: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: NetworkImage(cardList.product.image),
                        fit: BoxFit.cover)),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      cardList.product.name,
                      style: subtitleStyle.copyWith(
                          fontSize: 22, fontWeight: FontWeight.w700),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text(
                        NumberFormat.currency(
                                locale: 'id', symbol: 'Rp', decimalDigits: 2)
                            .format(cardList.product.harga),
                        style: subtitleStyle.copyWith(
                            color: primaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w700),
                      ),
                    )
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      cartController.removeFromCart(cardList.id);
                    },
                    icon: const Icon(Icons.delete),
                  ),
                  Container(
                    width: 80,
                    height: 35,
                    decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: whiteColor),
                          child: IconButton(
                            iconSize: 20,
                            padding: EdgeInsets.zero,
                            onPressed: () {},
                            icon: const Icon(Icons.remove),
                            color: blackColor,
                          ),
                        ),
                        Text(
                          '${cardList.qty}',
                          style: subtitleStyle.copyWith(
                            fontWeight: FontWeight.w700,
                            color: whiteColor,
                          ),
                        ),
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: whiteColor),
                          child: IconButton(
                            iconSize: 20,
                            padding: EdgeInsets.zero,
                            onPressed: () {},
                            icon: const Icon(Icons.add),
                            color: blackColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }
}

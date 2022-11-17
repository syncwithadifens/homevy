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
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                            onTap: () => Get.defaultDialog(
                                cancel: GestureDetector(
                                    onTap: () => Get.back(),
                                    child: const Icon(Icons.cancel)),
                                content: Container(
                                  width: Get.width,
                                  height: 200,
                                  decoration: BoxDecoration(
                                      color: whiteColor,
                                      borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(15),
                                          topRight: Radius.circular(15))),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        20, 10, 20, 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Order Information',
                                          style: subtitleStyle.copyWith(
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 3),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                width: 100,
                                                height: 100,
                                                padding:
                                                    const EdgeInsets.all(8),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    boxShadow: [
                                                      BoxShadow(
                                                          offset: const Offset(
                                                              0, 5),
                                                          spreadRadius: 1,
                                                          blurRadius: 3,
                                                          color: greyColor)
                                                    ],
                                                    color: whiteColor),
                                                child: Image.network(
                                                    cardList.product.image),
                                              ),
                                              Obx(() => Container(
                                                    width: 80,
                                                    height: 35,
                                                    decoration: BoxDecoration(
                                                        color: secondaryColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        Container(
                                                          height: 20,
                                                          width: 20,
                                                          decoration:
                                                              BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  color:
                                                                      whiteColor),
                                                          child: IconButton(
                                                            iconSize: 20,
                                                            padding:
                                                                EdgeInsets.zero,
                                                            onPressed: () {
                                                              cartController
                                                                  .decreaseQuantity();
                                                            },
                                                            icon: const Icon(
                                                                Icons.remove),
                                                            color: blackColor,
                                                          ),
                                                        ),
                                                        Text(
                                                          '${cartController.quantity.value}',
                                                          style: subtitleStyle
                                                              .copyWith(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color: whiteColor,
                                                          ),
                                                        ),
                                                        Container(
                                                          height: 20,
                                                          width: 20,
                                                          decoration:
                                                              BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  color:
                                                                      whiteColor),
                                                          child: IconButton(
                                                            iconSize: 20,
                                                            padding:
                                                                EdgeInsets.zero,
                                                            onPressed: () {
                                                              cartController
                                                                  .increaseQuantity();
                                                            },
                                                            icon: const Icon(
                                                                Icons.add),
                                                            color: blackColor,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )),
                                            ],
                                          ),
                                        ),
                                        const Spacer(),
                                        GestureDetector(
                                          onTap: () => cartController
                                              .addToCart(cardList.productId)
                                              .then((value) => Get.back()),
                                          child: Container(
                                            height: 40,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            width: Get.width,
                                            decoration: BoxDecoration(
                                                color: secondaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Save',
                                                  style: subtitleStyle.copyWith(
                                                      color: whiteColor),
                                                ),
                                                Container(
                                                  height: 30,
                                                  width: 30,
                                                  decoration: BoxDecoration(
                                                      color: whiteColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: const Icon(
                                                      Icons.chevron_right),
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )),
                            child: const Icon(Icons.edit_note_rounded)),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: GestureDetector(
                              onTap: () =>
                                  cartController.removeFromCart(cardList.id),
                              child: const Icon(Icons.delete)),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 10),
                      decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(
                          '${cardList.qty} x',
                          style: subtitleStyle.copyWith(
                            fontWeight: FontWeight.w700,
                            color: whiteColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}

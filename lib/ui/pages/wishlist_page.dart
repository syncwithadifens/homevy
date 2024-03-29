import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homevy/controllers/cart_controller.dart';
import 'package:homevy/controllers/wishlist_controller.dart';
import 'package:homevy/theme/styles.dart';
import 'package:homevy/ui/pages/detail_page.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import 'cart_page.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    final wishlistController = Get.put(WishlistController());
    final cartController = Get.put(CartController());
    return Scaffold(
      backgroundColor: const Color(0xffe7e7e7),
      body: RefreshIndicator(
        onRefresh: () => wishlistController.getWishlist(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
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
                        'Wishlist',
                        style: subtitleStyle.copyWith(
                            fontSize: 22, fontWeight: FontWeight.w700),
                      ),
                    )
                  ],
                ),
                Obx(
                  () => wishlistController.isLoading.value
                      ? const Expanded(
                          child: Center(
                          child: CircularProgressIndicator(),
                        ))
                      : wishlistController.favoriteItem.isEmpty
                          ? Expanded(
                              child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Oooops!',
                                    style: titleStyle,
                                  ),
                                  Lottie.asset('assets/empty_cart.json',
                                      repeat: false, width: 300, height: 300),
                                  Text(
                                    'Your wishlist is empty',
                                    style: titleStyle,
                                  )
                                ],
                              ),
                            ))
                          : Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: GridView.builder(
                                  padding: const EdgeInsets.only(bottom: 15),
                                  itemCount: wishlistController
                                      .favoriteList!.data.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 20,
                                          mainAxisSpacing: 20,
                                          mainAxisExtent: 260),
                                  itemBuilder: (context, index) {
                                    return Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: whiteColor,
                                          boxShadow: [
                                            BoxShadow(
                                                offset: const Offset(0, 5),
                                                spreadRadius: 1,
                                                blurRadius: 3,
                                                color: greyColor)
                                          ]),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: () => Get.to(() =>
                                                DetailPage(
                                                    productDetail:
                                                        wishlistController
                                                            .favoriteList!
                                                            .data[index]
                                                            .product)),
                                            child: Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: Center(
                                                child: Image.network(
                                                  wishlistController
                                                      .favoriteList!
                                                      .data[index]
                                                      .product
                                                      .image,
                                                  fit: BoxFit.fill,
                                                  height: 100,
                                                ),
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () => Get.to(() =>
                                                DetailPage(
                                                    productDetail:
                                                        wishlistController
                                                            .favoriteList!
                                                            .data[index]
                                                            .product)),
                                            child: Text(
                                              wishlistController.favoriteList!
                                                  .data[index].product.name,
                                              style: subtitleStyle.copyWith(
                                                  fontWeight: FontWeight.w700),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 5),
                                            child: Text(
                                                NumberFormat.currency(
                                                        locale: 'id',
                                                        symbol: 'Rp',
                                                        decimalDigits: 2)
                                                    .format(wishlistController
                                                        .favoriteList!
                                                        .data[index]
                                                        .product
                                                        .harga),
                                                style: subtitleStyle.copyWith(
                                                    color: primaryColor,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w700)),
                                          ),
                                          Obx(
                                              () =>
                                                  cartController.existQty
                                                          .containsKey(
                                                              wishlistController
                                                                  .favoriteList!
                                                                  .data[index]
                                                                  .productId)
                                                      ? Center(
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                                color:
                                                                    secondaryColor),
                                                            margin:
                                                                const EdgeInsets
                                                                        .only(
                                                                    bottom: 10,
                                                                    top: 10),
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8),
                                                            child: Text(
                                                              'added to cart',
                                                              style: subtitleStyle
                                                                  .copyWith(
                                                                      color:
                                                                          primaryColor),
                                                            ),
                                                          ),
                                                        )
                                                      : Center(
                                                          child: Container(
                                                            margin:
                                                                const EdgeInsets
                                                                        .only(
                                                                    bottom: 10,
                                                                    top: 10),
                                                            decoration: BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                color:
                                                                    secondaryColor,
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                      offset:
                                                                          const Offset(3,
                                                                              3),
                                                                      spreadRadius:
                                                                          1,
                                                                      blurRadius:
                                                                          3,
                                                                      color:
                                                                          greyColor)
                                                                ]),
                                                            child:
                                                                GestureDetector(
                                                              onTap: () {
                                                                showModalBottomSheet(
                                                                    backgroundColor:
                                                                        Colors
                                                                            .transparent,
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (context) {
                                                                      return Container(
                                                                        padding: const EdgeInsets.fromLTRB(
                                                                            20,
                                                                            10,
                                                                            20,
                                                                            10),
                                                                        width: Get
                                                                            .width,
                                                                        height:
                                                                            250,
                                                                        decoration: BoxDecoration(
                                                                            color:
                                                                                whiteColor,
                                                                            borderRadius:
                                                                                const BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15))),
                                                                        child:
                                                                            Column(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Text(
                                                                              'Order Information',
                                                                              style: subtitleStyle.copyWith(fontWeight: FontWeight.w700),
                                                                            ),
                                                                            Row(
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Container(
                                                                                  width: 100,
                                                                                  height: 100,
                                                                                  padding: const EdgeInsets.all(8),
                                                                                  decoration: BoxDecoration(
                                                                                      borderRadius: BorderRadius.circular(10),
                                                                                      boxShadow: [
                                                                                        BoxShadow(offset: const Offset(0, 5), spreadRadius: 1, blurRadius: 3, color: greyColor)
                                                                                      ],
                                                                                      color: whiteColor),
                                                                                  child: Image.network(wishlistController.favoriteList!.data[index].product.image),
                                                                                ),
                                                                                Expanded(
                                                                                  child: Padding(
                                                                                    padding: const EdgeInsets.only(left: 15),
                                                                                    child: Column(
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Text(
                                                                                          wishlistController.favoriteList!.data[index].product.name,
                                                                                          style: subtitleStyle.copyWith(fontWeight: FontWeight.w700),
                                                                                          maxLines: 3,
                                                                                          overflow: TextOverflow.ellipsis,
                                                                                        ),
                                                                                        Text(NumberFormat.currency(locale: 'id', symbol: 'Rp', decimalDigits: 2).format(wishlistController.favoriteList!.data[index].product.harga), style: subtitleStyle.copyWith(color: primaryColor, fontSize: 14, fontWeight: FontWeight.w700)),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Obx(() => Container(
                                                                                      width: 80,
                                                                                      height: 35,
                                                                                      decoration: BoxDecoration(color: secondaryColor, borderRadius: BorderRadius.circular(10)),
                                                                                      child: Row(
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                        children: [
                                                                                          Container(
                                                                                            height: 20,
                                                                                            width: 20,
                                                                                            decoration: BoxDecoration(shape: BoxShape.circle, color: whiteColor),
                                                                                            child: IconButton(
                                                                                              iconSize: 20,
                                                                                              padding: EdgeInsets.zero,
                                                                                              onPressed: () {
                                                                                                cartController.decreaseQuantity(wishlistController.favoriteList!.data[index].productId);
                                                                                              },
                                                                                              icon: const Icon(Icons.remove),
                                                                                              color: blackColor,
                                                                                            ),
                                                                                          ),
                                                                                          Text(
                                                                                            '${cartController.newQty}',
                                                                                            style: subtitleStyle.copyWith(
                                                                                              fontWeight: FontWeight.w700,
                                                                                              color: whiteColor,
                                                                                            ),
                                                                                          ),
                                                                                          Container(
                                                                                            height: 20,
                                                                                            width: 20,
                                                                                            decoration: BoxDecoration(shape: BoxShape.circle, color: whiteColor),
                                                                                            child: IconButton(
                                                                                              iconSize: 20,
                                                                                              padding: EdgeInsets.zero,
                                                                                              onPressed: () {
                                                                                                cartController.increaseQuantity(wishlistController.favoriteList!.data[index].productId);
                                                                                              },
                                                                                              icon: const Icon(Icons.add),
                                                                                              color: blackColor,
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    )),
                                                                              ],
                                                                            ),
                                                                            GestureDetector(
                                                                              onTap: () {
                                                                                cartController.existQty.containsKey(wishlistController.favoriteList!.data[index].productId)
                                                                                    ? Get.snackbar(
                                                                                        'Ooops!',
                                                                                        'You already add this item on cart before',
                                                                                        snackPosition: SnackPosition.BOTTOM,
                                                                                        margin: const EdgeInsets.only(bottom: 5, left: 5, right: 5),
                                                                                        backgroundColor: redColor,
                                                                                        colorText: whiteColor,
                                                                                      )
                                                                                    : cartController.addToCart(wishlistController.favoriteList!.data[index].productId, 'new').then((value) => Get.to(() => const CartPage()));
                                                                              },
                                                                              child: Container(
                                                                                height: 50,
                                                                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                                                                width: Get.width,
                                                                                decoration: BoxDecoration(color: secondaryColor, borderRadius: BorderRadius.circular(10)),
                                                                                child: Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Text(
                                                                                      'Add to cart',
                                                                                      style: subtitleStyle.copyWith(color: whiteColor),
                                                                                    ),
                                                                                    Container(
                                                                                      height: 30,
                                                                                      width: 30,
                                                                                      decoration: BoxDecoration(color: whiteColor, borderRadius: BorderRadius.circular(10)),
                                                                                      child: const Icon(Icons.chevron_right),
                                                                                    )
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      );
                                                                    });
                                                              },
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(5),
                                                                child: Icon(
                                                                  Icons
                                                                      .shopping_cart,
                                                                  color:
                                                                      primaryColor,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        )),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:get/get.dart';
import 'package:homevy/controllers/cart_controller.dart';
import 'package:homevy/controllers/review_controller.dart';
import 'package:homevy/controllers/wishlist_controller.dart';
import 'package:homevy/theme/styles.dart';
import 'package:homevy/ui/pages/cart_page.dart';
import 'package:intl/intl.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.productDetail});
  final dynamic productDetail;
  @override
  Widget build(BuildContext context) {
    final wishlistController = Get.put(WishlistController());
    final cartController = Get.put(CartController());
    final reviewController = Get.put(ReviewController());
    reviewController.getReview(productDetail.id);
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    margin: const EdgeInsets.only(top: 20),
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
                    padding: const EdgeInsets.only(top: 25),
                    child: Text(
                      'Detail Product',
                      style: subtitleStyle.copyWith(
                          fontSize: 22, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Obx(() => IconButton(
                      padding: const EdgeInsets.only(top: 20),
                      onPressed: () {
                        wishlistController.toggleFavorite(productDetail.id);
                      },
                      iconSize: 30,
                      icon: wishlistController.favoriteItem
                              .containsKey(productDetail.id)
                          ? Icon(
                              Icons.favorite,
                              color: redColor,
                            )
                          : const Icon(Icons.favorite_border)))
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30, bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          productDetail.name,
                          style: const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 8),
                          child: SizedBox(
                            height: 150,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  NumberFormat.currency(
                                          locale: 'id',
                                          symbol: 'Rp',
                                          decimalDigits: 2)
                                      .format(productDetail.harga),
                                  style: subtitleStyle.copyWith(
                                      color: primaryColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                ),
                                Image.network(
                                  productDetail.image,
                                  width: 150,
                                  fit: BoxFit.fill,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 200,
                                      child: Text(productDetail.name,
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black)),
                                    ),
                                    Obx(() => cartController.existQty
                                            .containsKey(productDetail.id)
                                        ? Text(
                                            'In cart',
                                            style: subtitleStyle.copyWith(
                                                color: redColor),
                                          )
                                        : Row(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  cartController
                                                      .decreaseQuantity(
                                                          productDetail.id);
                                                },
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(5),
                                                  decoration: BoxDecoration(
                                                      color: secondaryColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.grey
                                                              .withOpacity(0.5),
                                                          spreadRadius: 3,
                                                          blurRadius: 10,
                                                          offset: const Offset(
                                                              0, 3),
                                                        ),
                                                      ]),
                                                  child: Icon(
                                                    CupertinoIcons.minus,
                                                    size: 15,
                                                    color: whiteColor,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                  margin: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 10),
                                                  child: Text(
                                                    '${cartController.newQty}',
                                                    style: const TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black,
                                                    ),
                                                  )),
                                              GestureDetector(
                                                onTap: () {
                                                  cartController
                                                      .increaseQuantity(
                                                          productDetail.id);
                                                },
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(5),
                                                  decoration: BoxDecoration(
                                                      color: secondaryColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.grey
                                                              .withOpacity(0.5),
                                                          spreadRadius: 3,
                                                          blurRadius: 10,
                                                          offset: const Offset(
                                                              0, 3),
                                                        ),
                                                      ]),
                                                  child: Icon(
                                                    CupertinoIcons.plus,
                                                    size: 15,
                                                    color: whiteColor,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ))
                                  ],
                                ),
                                Divider(
                                  color: blackColor,
                                ),
                                const Text("Description:",
                                    style: TextStyle(fontSize: 16)),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Text(
                                    productDetail.deskripsi,
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                ),
                              ]),
                        ),
                        GestureDetector(
                          onTap: () {
                            cartController.existQty
                                    .containsKey(productDetail.id)
                                ? Get.snackbar(
                                    'Ooops!',
                                    'You already add this item on cart before',
                                    snackPosition: SnackPosition.BOTTOM,
                                    margin: const EdgeInsets.only(
                                        bottom: 5, left: 5, right: 5),
                                    backgroundColor: redColor,
                                    colorText: whiteColor,
                                  )
                                : cartController
                                    .addToCart(productDetail.id, 'new')
                                    .then((value) =>
                                        Get.to(() => const CartPage()));
                          },
                          child: Container(
                            margin: const EdgeInsets.only(top: 10),
                            height: 50,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: secondaryColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Text(
                                'Add to Cart',
                                style:
                                    subtitleStyle.copyWith(color: whiteColor),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            'Reviews',
                            style: titleStyle,
                          ),
                        ),
                        Obx(() => reviewController.isLoading.value
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : reviewController.userReview!.data.isEmpty
                                ? const Center(
                                    child: Text('There is no review'),
                                  )
                                : ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: reviewController
                                        .userReview!.data.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 8),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        padding: const EdgeInsets.all(10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              reviewController.userReview!
                                                  .data[index].user.name,
                                              style: subtitleStyle.copyWith(
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 5, bottom: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  RatingStars(
                                                    starCount: 5,
                                                    valueLabelVisibility: false,
                                                    value: reviewController
                                                        .userReview!
                                                        .data[index]
                                                        .star
                                                        .toDouble(),
                                                  ),
                                                  Text(
                                                    DateFormat('d MMM yyyy')
                                                        .format(reviewController
                                                            .userReview!
                                                            .data[index]
                                                            .updatedAt),
                                                    style: TextStyle(
                                                        color: greyColor),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Text(reviewController.userReview!
                                                .data[index].review),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: Image.network(
                                                  reviewController.userReview!
                                                      .data[index].image,
                                                  height: 100,
                                                  fit: BoxFit.fitWidth,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                  ))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

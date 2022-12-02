import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homevy/controllers/cart_controller.dart';
import 'package:homevy/models/cart_model.dart';
import 'package:homevy/theme/styles.dart';
import 'package:homevy/ui/pages/detail_page.dart';
import 'package:intl/intl.dart';

class ProductCart extends StatelessWidget {
  const ProductCart({Key? key, required this.cardList}) : super(key: key);
  final Datum cardList;
  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();
    return Dismissible(
      key: Key('item ${cardList.product}'),
      onDismissed: (direction) => cartController.removeFromCart(cardList.id),
      direction: DismissDirection.endToStart,
      background: Container(
        padding: const EdgeInsets.only(right: 20),
        color: redColor,
        child: Align(
          alignment: Alignment.centerRight,
          child: Text(
            'remove',
            style: titleStyle,
          ),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
        height: 100,
        width: Get.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: whiteColor),
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () =>
                      Get.to(DetailPage(productDetail: cardList.product)),
                  child: Container(
                    height: 90,
                    width: 90,
                    margin: const EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                        color: bgColor,
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: NetworkImage(cardList.product.image),
                            fit: BoxFit.cover)),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () => Get.to(
                              DetailPage(productDetail: cardList.product)),
                          child: Text(
                            cardList.product.name,
                            style: subtitleStyle.copyWith(
                                fontSize: 18, fontWeight: FontWeight.w700),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          '${cardList.product.stock} remaining',
                          style: subtitleStyle.copyWith(
                            fontSize: 12,
                            color: greyColor,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const Spacer(),
                        Text(
                          NumberFormat.currency(
                                  locale: 'id', symbol: 'Rp', decimalDigits: 2)
                              .format(cardList.product.harga),
                          style: subtitleStyle.copyWith(
                              color: primaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 10, right: 8),
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          border: Border.all(color: lightGreyColor),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                              onTap: () => cartController
                                  .decreaseQuantity(cardList.productId),
                              child: Icon(Icons.remove, color: redColor)),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                                '${cartController.existQty[cardList.productId]}'),
                          ),
                          GestureDetector(
                              onTap: () => cartController
                                  .increaseQuantity(cardList.productId),
                              child: const Icon(Icons.add, color: Colors.green))
                        ],
                      ),
                    ),
                  ],
                )
              ],
            )),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homevy/theme/styles.dart';
import 'package:homevy/ui/pages/cart_page.dart';
import 'package:homevy/ui/pages/home_page.dart';
import 'package:homevy/ui/pages/profile_page.dart';
import 'package:homevy/ui/pages/transaction_page.dart';
import 'package:homevy/ui/pages/wishlist_page.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: bgColor, boxShadow: [
        BoxShadow(
          color: bgColor,
          offset: const Offset(0, -5),
          spreadRadius: 1,
          blurRadius: 8,
        )
      ]),
      child: BottomAppBar(
        color: whiteColor,
        notchMargin: 6,
        shape: const CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    Get.to(() => const HomePage());
                  },
                  icon: Icon(
                    Icons.home,
                    color: secondaryColor,
                  )),
              IconButton(
                  onPressed: () {
                    Get.to(() => const CartPage());
                  },
                  icon: Icon(
                    Icons.shopping_cart,
                    color: secondaryColor,
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 90),
                child: IconButton(
                    onPressed: () {
                      Get.to(() => const TransactionPage());
                    },
                    icon: Icon(
                      Icons.shopping_bag,
                      color: secondaryColor,
                    )),
              ),
              IconButton(
                  onPressed: () {
                    Get.to(() => const ProfilePage());
                  },
                  icon: Icon(
                    Icons.person,
                    color: secondaryColor,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomFab extends StatelessWidget {
  const CustomFab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: secondaryColor,
      onPressed: () {
        Get.to(() => const WishlistPage());
      },
      child: const Icon(Icons.favorite),
    );
  }
}

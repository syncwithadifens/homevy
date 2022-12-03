import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homevy/theme/styles.dart';
import 'package:homevy/ui/pages/cart_page.dart';
import 'package:homevy/ui/pages/home_page.dart';
import 'package:homevy/ui/pages/profile_page.dart';
import 'package:homevy/ui/pages/transaction_page.dart';
import 'package:homevy/ui/pages/wishlist_page.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  static var currentId = 0;

  const CustomBottomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    CustomBottomNavigationBar.currentId;
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
        color: secondaryColor,
        notchMargin: 6,
        shape: const CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      CustomBottomNavigationBar.currentId = 0;
                    });
                    Get.to(() => const HomePage());
                  },
                  icon: CustomBottomNavigationBar.currentId == 0
                      ? Icon(
                          Icons.home_rounded,
                          color: whiteColor,
                        )
                      : Icon(
                          Icons.home_outlined,
                          color: whiteColor,
                        )),
              IconButton(
                  onPressed: () {
                    Get.to(() => const WishlistPage());
                  },
                  icon: Icon(
                    Icons.favorite_outline,
                    color: whiteColor,
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 90),
                child: IconButton(
                    onPressed: () {
                      Get.to(() => const TransactionPage());
                    },
                    icon: CustomBottomNavigationBar.currentId == 2
                        ? Icon(
                            Icons.receipt_long,
                            color: whiteColor,
                          )
                        : Icon(
                            Icons.receipt_long_outlined,
                            color: whiteColor,
                          )),
              ),
              IconButton(
                  onPressed: () {
                    setState(() {
                      CustomBottomNavigationBar.currentId = 3;
                    });
                    Get.to(() => const ProfilePage());
                  },
                  icon: CustomBottomNavigationBar.currentId == 3
                      ? Icon(
                          Icons.person_rounded,
                          color: whiteColor,
                        )
                      : Icon(
                          Icons.person_outline,
                          color: whiteColor,
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
      backgroundColor: primaryColor,
      onPressed: () {
        Get.to(() => const CartPage());
      },
      child: Icon(
        Icons.local_mall_outlined,
        color: secondaryColor,
      ),
    );
  }
}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:homevy/theme/styles.dart';
import 'package:homevy/ui/pages/cart_page.dart';
import 'package:homevy/ui/pages/profile_page.dart';
import 'package:homevy/ui/pages/wishlist_page.dart';
import 'package:homevy/ui/widgets/home_category_item.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () {
                  Get.to(() => const HomePage());
                },
                icon: Icon(Icons.home, color: blackColor)),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () {
                  Get.to(() => const Wishlist());
                },
                icon: Icon(Icons.favorite, color: blackColor)),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () {
                  Get.to(() => const CartPage());
                },
                icon: Icon(Icons.shopping_cart, color: blackColor)),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () {
                  Get.to(() => const ProfilePage());
                },
                icon: Icon(Icons.person, color: blackColor)),
            label: 'Profile',
          ),
        ],
      ),
      body: ListView(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(
                    top: 21,
                    left: 24,
                    right: 24,
                  ),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: whiteColor,
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.search,
                        size: 17.5,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Try “Sofa”, “Chair”, “Table”',
                        style: greyTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 18,
          ),
          Container(
            margin: const EdgeInsets.only(
              left: 24,
              right: 24,
            ),
            child: Text(
              'Category',
              style: blackTextStyle.copyWith(
                fontSize: 22,
                fontWeight: bold,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 25,
            ),
            child: CarouselSlider(
              items: const [
                HomeCategoryItem(
                  title: 'Chair',
                  subtitle: 'Sahaja, Kiya Dinning...',
                  imageUrl: 'assets/chair.png',
                ),
                HomeCategoryItem(
                  title: 'Table',
                  subtitle: 'Sahaja, Kiya Dinning...',
                  imageUrl: 'assets/table.png',
                ),
                HomeCategoryItem(
                  title: 'Chair',
                  subtitle: 'Sahaja, Kiya Dinning...',
                  imageUrl: 'assets/chair.png',
                ),
                HomeCategoryItem(
                  title: 'Table',
                  subtitle: 'Sahaja, Kiya Dinning...',
                  imageUrl: 'assets/table.png',
                ),
              ],
              options: CarouselOptions(
                height: 148,
                enableInfiniteScroll: false,
                viewportFraction: 1,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 20,
              left: 24,
              right: 24,
            ),
            child: Text(
              'Product For You',
              style: blackTextStyle.copyWith(
                fontSize: 22,
                fontWeight: bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}

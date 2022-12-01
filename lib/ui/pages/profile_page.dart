import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:homevy/controllers/auth_controller.dart';
import 'package:homevy/theme/styles.dart';
import 'package:homevy/ui/pages/transaction_page.dart';
import 'package:homevy/ui/pages/wishlist_page.dart';
import 'package:homevy/ui/widgets/custom_bottom_navigation.dart';
import 'package:homevy/ui/widgets/custom_profile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();
    return AnnotatedRegion(
      value:
          const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light),
      child: Scaffold(
          backgroundColor: secondaryColor,
          bottomNavigationBar: const CustomBottomNavigationBar(),
          floatingActionButton: const CustomFab(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
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
                            boxShadow: [
                              BoxShadow(
                                  offset: const Offset(0, 5),
                                  spreadRadius: 1,
                                  blurRadius: 10,
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
                          'Profile',
                          style: subtitleStyle.copyWith(
                              color: whiteColor,
                              fontSize: 24,
                              fontWeight: FontWeight.w700),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 20),
                  child: Stack(
                    children: [
                      const CustomProfile(
                        h: 150,
                        w: 150,
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: GestureDetector(
                          onTap: () => authController.logout(),
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                color: secondaryColor,
                                shape: BoxShape.circle,
                                border: Border.all(color: greyColor)),
                            child: Icon(
                              Icons.logout,
                              color: whiteColor,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Text(
                  authController.userData!.data!.user!.name ?? 'Unknown',
                  style: subtitleStyle.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: whiteColor),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                        color: bgColor,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24))),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.face,
                                size: 30,
                                color: greyColor,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  'Edit Profile',
                                  style: subtitleStyle.copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  size: 30,
                                  color: greyColor,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Text(
                                    'Shopping Address',
                                    style: subtitleStyle.copyWith(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: GestureDetector(
                              onTap: () => Get.to(() => const WishlistPage()),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.favorite,
                                    size: 30,
                                    color: greyColor,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Text(
                                      'Wishlist',
                                      style: subtitleStyle.copyWith(
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: GestureDetector(
                              onTap: () =>
                                  Get.to(() => const TransactionPage()),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.shopping_bag,
                                    size: 30,
                                    color: greyColor,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Text(
                                      'My Order',
                                      style: subtitleStyle.copyWith(
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.notifications,
                                  size: 30,
                                  color: greyColor,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Text(
                                    'Notification',
                                    style: subtitleStyle.copyWith(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.credit_card,
                                  size: 30,
                                  color: greyColor,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Text(
                                    'Payment',
                                    style: subtitleStyle.copyWith(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homevy/controllers/auth_controller.dart';
import 'package:homevy/theme/styles.dart';
import 'package:homevy/ui/widgets/custom_profile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();
    return Scaffold(
        backgroundColor: secondaryColor,
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
              const Padding(
                padding: EdgeInsets.only(top: 30, bottom: 20),
                child: CustomProfile(
                  h: 150,
                  w: 150,
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
                      color: whiteColor,
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
                                  'Whistlist',
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
                            children: [
                              Icon(
                                Icons.history,
                                size: 30,
                                color: greyColor,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  'Order History',
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
                        Expanded(
                          child: Padding(
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
                        ),
                        GestureDetector(
                          onTap: () {
                            authController.logout();
                          },
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: secondaryColor),
                            child: Center(
                              child: Text(
                                'Logout',
                                style: subtitleStyle.copyWith(
                                    color: whiteColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

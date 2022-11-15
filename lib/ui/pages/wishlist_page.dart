import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homevy/theme/styles.dart';

class Wishlist extends StatelessWidget {
  const Wishlist({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe7e7e7),
      body: SafeArea(
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
                    'Your Wishlist Furniture',
                    style: subtitleStyle.copyWith(
                        fontSize: 22, fontWeight: FontWeight.w700),
                  ),
                )
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      mainAxisExtent: 250),
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: whiteColor,
                              boxShadow: [
                                BoxShadow(
                                    offset: const Offset(0, 5),
                                    spreadRadius: 1,
                                    blurRadius: 3,
                                    color: greyColor)
                              ]),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: Image.asset('assets/chair.png'),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Kursi kantor',
                                            style: subtitleStyle.copyWith(
                                                fontWeight: FontWeight.w700),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 5),
                                            child: Text('Rp200.000',
                                                style: subtitleStyle.copyWith(
                                                    color: primaryColor,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w700)),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          right: 8,
                          bottom: 8,
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: bgColor),
                            child: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.shopping_cart)),
                          ),
                        ),
                        Positioned(
                          right: 5,
                          top: 5,
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: bgColor,
                                boxShadow: [
                                  BoxShadow(
                                      offset: const Offset(0, 5),
                                      spreadRadius: 1,
                                      blurRadius: 3,
                                      color: greyColor)
                                ]),
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {},
                              icon: const Icon(Icons.favorite),
                              color: Colors.red,
                            ),
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}

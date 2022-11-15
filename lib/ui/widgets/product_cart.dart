import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homevy/theme/styles.dart';

class ProductCart extends StatelessWidget {
  const ProductCart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                      image: AssetImage('assets/chair.png'))),
            ),
            Expanded(
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 0, 5),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Kursi kantor',
                            style: subtitleStyle.copyWith(
                                fontSize: 22, fontWeight: FontWeight.w700),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text(
                              'Rp3.500.000',
                              style: subtitleStyle.copyWith(
                                  color: primaryColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                            ),
                          )
                        ],
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                          width: 80,
                          height: 35,
                          decoration: BoxDecoration(
                              color: secondaryColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle, color: whiteColor),
                                child: IconButton(
                                  iconSize: 20,
                                  padding: EdgeInsets.zero,
                                  onPressed: () {},
                                  icon: const Icon(Icons.remove),
                                  color: blackColor,
                                ),
                              ),
                              Text(
                                '3',
                                style: subtitleStyle.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: whiteColor,
                                ),
                              ),
                              Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle, color: whiteColor),
                                child: IconButton(
                                  iconSize: 20,
                                  padding: EdgeInsets.zero,
                                  onPressed: () {},
                                  icon: const Icon(Icons.add),
                                  color: blackColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

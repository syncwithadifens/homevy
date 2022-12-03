import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homevy/theme/styles.dart';

class HomeCategoryItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imageUrl;

  const HomeCategoryItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.only(left: 180, right: 8),
              height: 100,
              width: Get.width,
              decoration: BoxDecoration(
                  color: whiteColor, borderRadius: BorderRadius.circular(20)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: subtitleStyle.copyWith(
                        fontWeight: FontWeight.w600, fontSize: 18),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    subtitle,
                    style: subtitleStyle.copyWith(color: greyColor),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 15,
            child: SizedBox(
              height: 100,
              width: 150,
              child: Image.network(
                imageUrl,
                fit: BoxFit.fill,
              ),
            ),
          )
        ],
      ),
    );
  }
}

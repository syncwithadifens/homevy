import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:homevy/theme/styles.dart';

class CustomProfile extends StatelessWidget {
  const CustomProfile({Key? key, this.w = 100, this.h = 100}) : super(key: key);
  final double w, h;
  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.Circle,
      dashPattern: const [20, 5],
      color: greyColor,
      child: Container(
        height: h,
        width: w,
        decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                image: AssetImage('assets/profile.png'), fit: BoxFit.cover)),
      ),
    );
  }
}

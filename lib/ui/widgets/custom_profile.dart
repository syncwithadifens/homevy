import 'package:flutter/material.dart';

import '../../theme/styles.dart';

class CustomProfile extends StatelessWidget {
  const CustomProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          width: 103,
          height: 103,
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: primaryColor),
        ),
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(shape: BoxShape.circle, color: greyColor),
        ),
      ],
    );
  }
}

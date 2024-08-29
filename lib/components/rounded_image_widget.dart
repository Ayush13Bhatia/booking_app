import 'package:flutter/material.dart';

import '../constants/image_const.dart';
import '../utils/my-theme.dart';

class RoundedImageWidget extends StatelessWidget {
  final double? height;

  const RoundedImageWidget({super.key, this.height = 48});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 48,
      width: height ?? 48,
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border.all(color: MyColorTheme.primaryColor),
        borderRadius: BorderRadius.all(Radius.circular(height! / 2)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(height! / 2)),
        child: Image.asset(
          ImageConst.personImage,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

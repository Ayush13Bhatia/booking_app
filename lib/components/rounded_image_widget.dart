import 'package:flutter/material.dart';

import '../constants/image_const.dart';
import '../utils/my-theme.dart';

class RoundedImageWidget extends StatelessWidget {
  const RoundedImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: 48,
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border.all(color: MyColorTheme.primaryColor),
        borderRadius: const BorderRadius.all(Radius.circular(24)),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(24)),
        child: Image.asset(
          ImageConst.personImage,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

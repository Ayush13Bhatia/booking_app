import 'package:flutter/material.dart';

import '../utils/my-theme.dart';
import 'my_text.dart';

class BottomIconWidget extends StatelessWidget {
  final Function() ? onTap;
  final String ? title;
  final bool isVisible;
 final  IconData? icon;
 final Color ? iconColor;
 final Color ? textColor;
  const BottomIconWidget({super.key,this.iconColor,this.textColor,this.icon, this.isVisible = false,this.onTap,this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
           Icon(
         icon ??    Icons.home,
            size: 25,
            color: iconColor ?? MyColorTheme.primaryColor,
          ),
           MyText(
            title: title ?? 'Home',
             color: textColor,

          ),
          Visibility(
            visible: isVisible,
            child: Container(
              height: 8,
              width: 8,
              decoration: BoxDecoration(
                color: MyColorTheme.primaryColor,
                border: Border.all(color: MyColorTheme.primaryColor),
                borderRadius: const BorderRadius.all(Radius.circular(24)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

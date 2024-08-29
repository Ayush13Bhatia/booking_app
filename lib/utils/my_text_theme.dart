import 'dart:ui';

import '../constants/font_const.dart';
import 'my-theme.dart';

class MyTextTheme {
  static  TextStyle? appTextTheme({
    Color? textColor,
    FontWeight? fontWeight,
    double? fontSize,
  }) {
    return TextStyle(
      color: textColor ?? MyColorTheme.primaryColor,
      fontFamily: FontConst.play,
      fontWeight: fontWeight ?? FontWeight.w400,
      fontSize: fontSize ?? 16,
    );
  }
}

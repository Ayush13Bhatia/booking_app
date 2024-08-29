import 'package:flutter/material.dart';

import '../constants/font_const.dart';
import 'my-theme.dart';
import 'my_text_theme.dart';

class MyAppTheme {
  static myThemeData() {
    return ThemeData(
      drawerTheme: const DrawerThemeData(
        backgroundColor: MyColorTheme.whiteColor
      ),
      appBarTheme: const AppBarTheme(
        surfaceTintColor: MyColorTheme.whiteColor,
        color: MyColorTheme.whiteColor,
      ),
      elevatedButtonTheme:const  ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(MyColorTheme.primaryColor),
        ),
      ),
      cardTheme: CardTheme(
        color: MyColorTheme.whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      textTheme: MyAppTheme.textTheme,
      scaffoldBackgroundColor: MyColorTheme.whiteColor,
      useMaterial3: true,
    );
  }

  static const textTheme = TextTheme(
      bodySmall: TextStyle(
    color: MyColorTheme.primaryColor,
    fontFamily: FontConst.play,
    fontWeight: FontWeight.w400,
  ));
}

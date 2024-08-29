import 'package:booking_app/components/my_text.dart';
import 'package:booking_app/utils/my-theme.dart';
import 'package:flutter/material.dart';

class ElevationButtonWidget extends StatelessWidget {
  final Function()? onPressed;
  final String? title;
  final Widget ?chidlWidget;
  final Color ? backGroundColor;

  const ElevationButtonWidget({super.key,this.backGroundColor, this.onPressed,this.chidlWidget, this.title});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        padding: WidgetStateProperty.all(const EdgeInsets.all(0)),
        backgroundColor: WidgetStatePropertyAll(backGroundColor ?? MyColorTheme.primaryColor)
      ),

      onPressed: onPressed,
      child: chidlWidget ?? MyText(
        title: title ?? "Start",
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: MyColorTheme.whiteColor,
              fontSize: 12,
            ),
      ),
    );
  }
}

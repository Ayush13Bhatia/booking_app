import 'package:booking_app/components/my_text.dart';
import 'package:booking_app/utils/my-theme.dart';
import 'package:flutter/material.dart';

class ElevationButtonWidget extends StatelessWidget {
  final Function()? onPressed;
  final String? title;
  final Widget ?childWidget;
  final Color ? backGroundColor;
  final TextStyle? textStyle;

  const ElevationButtonWidget({super.key,this.textStyle,this.backGroundColor, this.onPressed,this.childWidget, this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: ElevatedButton(
        style: ButtonStyle(
          padding: WidgetStateProperty.all(const EdgeInsets.all(0)),
          backgroundColor: WidgetStatePropertyAll(backGroundColor ?? MyColorTheme.primaryColor)
        ),

        onPressed: onPressed,
        child: childWidget ?? MyText(
          title: title ?? "Start",
          style: textStyle ?? Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: MyColorTheme.whiteColor,
                fontSize: 11,
              ),
        ),
      ),
    );
  }
}

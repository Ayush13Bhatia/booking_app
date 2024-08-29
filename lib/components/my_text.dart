import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final String ? title;
  final  TextStyle? style;
  const MyText({super.key,this.title,this.style});

  @override
  Widget build(BuildContext context) {
    return Text(
      title ?? '',
      style: style ?? Theme.of(context).textTheme.bodySmall,
    );
  }
}


import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final String ? title;
  final  TextStyle? style;
  final int ? maxLine;
  final Color ? color;
  const MyText({super.key,this.color,this.title,this.style,this.maxLine});

  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: maxLine ?? 1,
      overflow: TextOverflow.ellipsis,
      title ?? '',
      style: style ?? Theme.of(context).textTheme.bodySmall?.copyWith(
        color: color,
      ),
    );
  }
}


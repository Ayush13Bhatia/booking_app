import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final Widget? child;
  final double? elevation;
  final double? height;
  final Color ? color;

  const CardWidget({super.key,this.color, this.height, this.child, this.elevation});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: SizedBox(
        height: height ?? 150,
        width: double.maxFinite,
        child: Card(
          color: color,
          elevation: elevation ?? 0,
          child: child,
        ),
      ),
    );
  }
}

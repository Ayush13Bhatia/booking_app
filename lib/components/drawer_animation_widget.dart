import 'package:booking_app/components/card_widget.dart';
import 'package:booking_app/components/drawer_widget.dart';
import 'package:booking_app/utils/my-theme.dart';
import 'package:flutter/material.dart';

class DrawerAnimationWidget extends StatefulWidget {
  final Widget child;
  const DrawerAnimationWidget({super.key,required this.child});

  @override
  State<DrawerAnimationWidget> createState() => _DrawerAnimationWidgetState();
}

class _DrawerAnimationWidgetState extends State<DrawerAnimationWidget> {
  Widget _renderContent() {
    final slideAmount = 0.0;//MediaQuery.of(context).size.width * 0.55 ;//* widget.controller.percentOpen;
    final contentScale =1.0;// - (0.2 * widget.controller.percentOpen);
    // final cornerRadius = widget.cornerRadius * widget.controller.percentOpen;

    return Transform(
      transform: Matrix4.translationValues(slideAmount, 0.0, 0.0)
        ..scale(

          contentScale,
          contentScale,
        ),
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () {
          // if (widget.hideOnContentTap) {
          //   widget.controller.close();
          // }
        },
        child: CardWidget(
          height: double.maxFinite,

            elevation: 10,
            child: widget.child),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.maxFinite,
      width: double.maxFinite,
      child: Stack(
        children: [
          Container(
            width: 300,
            height: double.infinity,
            child: DrawerWidget(),
          ),
          _renderContent(),
        ],
      ),
    );
  }
}

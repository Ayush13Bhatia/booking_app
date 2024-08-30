import 'package:booking_app/components/card_widget.dart';
import 'package:booking_app/components/drawer_widget.dart';
import 'package:booking_app/utils/my-theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_models/home_view_model.dart';

class DrawerAnimationWidget extends StatefulWidget {
  final Widget child;
  final bool isSize;
  final Function()? onTap;

  // final AnimationController controller;

  const DrawerAnimationWidget({
    super.key,
    this.onTap,
    this.isSize = false,
    required this.child,
    /*required this.controller,*/
  });

  @override
  State<DrawerAnimationWidget> createState() => _DrawerAnimationWidgetState();
}

class _DrawerAnimationWidgetState extends State<DrawerAnimationWidget> {
  // bool isAni = true;

  Widget _renderContent() {
    final slideAmount = !context.read<HomeViewModel>().isAnimatePage ? 1.0 : MediaQuery.of(context).size.width * 0.55;
    const contentScale = 1.0;

    return Transform(
      transform: Matrix4.translationValues(slideAmount, 0.0, 0.0)
        ..scale(
          contentScale,
          contentScale,
        ),
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: !context.read<HomeViewModel>().isAnimatePage
            ? null
            : () {
                context.read<HomeViewModel>().animate();
              },
        child: Padding(
          padding: EdgeInsets.only(top: !context.read<HomeViewModel>().isAnimatePage ? 0 : 70.0),
          child: Container(
            height: !context.read<HomeViewModel>().isAnimatePage ? double.maxFinite : 600,
            decoration: BoxDecoration(
                // color: Colors.green,
                borderRadius: BorderRadius.circular(20)),
            child: Card(
              color: Colors.red,
              elevation: !context.read<HomeViewModel>().isAnimatePage ? 0 : 10,
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Container(
                height: double.maxFinite,
                width: !context.read<HomeViewModel>().isAnimatePage ? double.maxFinite : 300,
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                child: widget.child,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      width: double.maxFinite,
      color: MyColorTheme.whiteColor,
      child: Stack(
        children: [
          SizedBox(
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

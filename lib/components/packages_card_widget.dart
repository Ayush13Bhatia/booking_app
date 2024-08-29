import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../utils/my-theme.dart';
import 'card_widget.dart';
import 'elevation_button_widget.dart';
import 'my_text.dart';

class PackagesCardWidget extends StatelessWidget {
  final Color? color;
  final String? title;
  final String? price;
  final String? description;

  const PackagesCardWidget({super.key, this.description, this.price, this.title, this.color});

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      color: color,
      height: 130,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(4),
            Row(
              children: [
                const Icon(
                  Icons.event_available,
                  size: 25,
                  color: MyColorTheme.whiteColor,
                ),
                const Spacer(),
                ElevationButtonWidget(
                  onPressed: () {},
                  title: 'Book Now',
                  textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: MyColorTheme.whiteColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                      ),
                )
              ],
            ),
            const Gap(12),
            Row(
              children: [
                MyText(
                  title: title,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: MyColorTheme.darkBlueColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 13.5,
                      ),
                ),
                const Spacer(),
                MyText(
                  title: '₹$price',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: MyColorTheme.darkBlueColor),
                ),
              ],
            ),
            const Gap(6),
            MyText(
              title: description,
              maxLine: 2,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: MyColorTheme.darkBlueColor,
                    fontSize: 10,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:booking_app/utils/my-theme.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'my_text.dart';

class DateTimeComponentWidget extends StatelessWidget {
  final String? title;
  final String? date;
  final String? time;

  const DateTimeComponentWidget({super.key, this.title, this.date, this.time});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(
          title: title ?? 'From',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: 12,
                color: MyColorTheme.blackColor,
                fontWeight: FontWeight.w300,
              ),
        ),
        const Gap(5),
        Row(
          children: [
            const Icon(
              Icons.calendar_month,
              color: MyColorTheme.primaryLightColor,
              size: 12,
            ),
            const Gap(1),
            MyText(
              title: date ?? '',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 12),
            )
          ],
        ),
        const Gap(5),
        Row(
          children: [
            const Icon(
              Icons.access_time,
              color: MyColorTheme.primaryLightColor,
              size: 12,
            ),
            const Gap(1),
            MyText(
              title: time ?? '',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 12),
            )
          ],
        ),
      ],
    );
  }
}

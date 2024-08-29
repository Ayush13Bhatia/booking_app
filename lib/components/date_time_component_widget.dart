import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'my_text.dart';

class DateTimeComponentWidget extends StatelessWidget {
  final String ? title;
  final String ? date;
  final String ? time;
  const DateTimeComponentWidget({super.key,this.title,this.date,this.time});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(
          title: title ?? 'From',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontSize: 12,
            color: Colors.black,
            fontWeight: FontWeight.w300,
          ),
        ),
        const Gap(5),
        Row(
          children: [
            const Icon(
              Icons.calendar_month,
              size: 10,
            ),
            MyText(
              title: date??  '12.08.2024',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 12),
            )
          ],
        ),
        const Gap(5),
        Row(
          children: [
            const Icon(
              Icons.access_time,
              size: 11,
            ),
            MyText(
              title: time ?? '11 pm',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 12),
            )
          ],
        ),
      ],
    );
  }
}

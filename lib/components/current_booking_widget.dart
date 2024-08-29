import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../utils/my-theme.dart';
import 'card_widget.dart';
import 'date_time_component_widget.dart';
import 'elevation_button_widget.dart';
import 'my_text.dart';

class CurrentBookingWidget extends StatelessWidget {
  final String ? title;
  final String ? fromTime;
  final String ? toTime;
  final String ? fromDate;
  final String ? toDate;
  const CurrentBookingWidget({super.key,this.toDate,this.toTime,this.fromDate,this.fromTime,this.title});

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                MyText(
                  title: title ??'',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 15,
                    color: MyColorTheme.primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                ElevationButtonWidget(
                  onPressed: () {},
                )
              ],
            ),
            const Gap(10),
             Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: DateTimeComponentWidget(
                    time: fromTime,
                    date: fromDate,

                  ),
                ),
                Expanded(
                  child: DateTimeComponentWidget(
                    title: 'To',
                    date: toDate,
                    time: toTime,
                  ),
                ),
              ],
            ),
            const Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevationButtonWidget(
                  backGroundColor: MyColorTheme.darkBlueColor,
                  childWidget: Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.star_border,
                          size: 15,
                          color: MyColorTheme.whiteColor,
                        ),
                        MyText(
                          title: "Rate Us",
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: MyColorTheme.whiteColor,
                            fontSize: 10,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                ElevationButtonWidget(
                  backGroundColor: MyColorTheme.darkBlueColor,
                  childWidget: Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          size: 15,
                          color: MyColorTheme.whiteColor,
                        ),
                        MyText(
                          title: "Geolocation",
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: MyColorTheme.whiteColor,
                            fontSize: 10,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                ElevationButtonWidget(
                  backGroundColor: MyColorTheme.darkBlueColor,
                  childWidget: Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 10),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.mic_none_outlined,
                          size: 15,
                          color: MyColorTheme.whiteColor,
                        ),
                        MyText(
                          title: "Surveillance",
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: MyColorTheme.whiteColor,
                            fontSize: 10,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:booking_app/components/rounded_image_widget.dart';
import 'package:booking_app/utils/my-theme.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'my_text.dart';

class DrawerWidget extends StatelessWidget {
  DrawerWidget({super.key});

  List<String> drawerList = [
    'Home',
    'Book A Nanny',
    'How It Works',
    'Why Nanny Vanny',
    'My Bookings',
    'My Profile',
    'Support',
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding:  EdgeInsets.only(left: 90.0,top: 70),
            child: RoundedImageWidget(
              height: 80,
            ),
          ),
          const Gap(10),
          Padding(
            padding: const EdgeInsets.only(left: 90.0),
            child: MyText(
              title: 'Emily Cyrus',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 16,
                    // color: MyColorTheme.primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
          // const Gap(20),
          Padding(
            padding: const EdgeInsets.only(left: 40.0),
            child: ListView.separated(
              shrinkWrap: true,
              separatorBuilder: (context, _) {
                return const Divider(
                  thickness: 0.3,
                  color: MyColorTheme.primaryLightColor,
                );
              },
              itemCount: drawerList.length,
              itemBuilder: (_, i) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MyText(
                    title: drawerList[i],
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: MyColorTheme.darkBlueColor,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

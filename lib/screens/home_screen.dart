import 'package:booking_app/components/my_text.dart';
import 'package:booking_app/utils/my-theme.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../components/date_time_component_widget.dart';
import '../components/elevation_button_widget.dart';
import '../components/rounded_image_widget.dart';
import '../constants/image_const.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 30.0),
            child: Image.asset(
              ImageConst.banner,
              width: 33,
              height: 33,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                children: [
                  const RoundedImageWidget(),
                  const Gap(13),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      MyText(
                        title: 'Welcome',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                      MyText(
                        title: 'Emily Cyrus',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontSize: 16,
                              // color: MyColorTheme.primaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 26, right: 10),
              child: Image.asset(ImageConst.homeBannerImage),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: MyText(
                title: 'Your Current Booking',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 16,
                      color: MyColorTheme.darkBlueColor,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: SizedBox(
                height: 150,
                width: double.maxFinite,
                child: Card(
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            MyText(
                              title: 'One Day Package',
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontSize: 15,
                                    color: MyColorTheme.primaryColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                            const Spacer(),
                            SizedBox(
                              height: 20,
                              child: ElevationButtonWidget(
                                onPressed: () {},
                              ),
                            )
                          ],
                        ),
                        const Gap(10),
                        const Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: DateTimeComponentWidget(),
                            ),
                            Expanded(
                              child: DateTimeComponentWidget(
                                title: 'To',
                                date: '12.08.2024',
                                time: '11 pm',
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              height: 20,
                              width: 100,
                              child: ElevationButtonWidget(
                                backGroundColor: MyColorTheme.darkBlueColor,
                                chidlWidget: Padding(
                                  padding: const EdgeInsets.only(left: 13.0),
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
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

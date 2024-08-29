import 'package:booking_app/components/drawer_animation_widget.dart';
import 'package:booking_app/components/drawer_widget.dart';
import 'package:booking_app/components/my_text.dart';
import 'package:booking_app/utils/my-theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import '../components/bottom_icon_widget.dart';
import '../components/current_booking_widget.dart';

import '../components/packages_card_widget.dart';
import '../components/rounded_image_widget.dart';
import '../constants/image_const.dart';
import '../models/current_booking_model.dart';
import '../models/package_model.dart';
import '../view_models/home_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  List<Map<String, dynamic>> bottomList = [
    {
      'title': 'home',
      'icon': Icons.home_outlined,
    },
    {
      'title': 'Packages',
      'icon': Icons.av_timer,
    },
    {
      'title': 'Bookings',
      'icon': Icons.access_time,
    },
    {
      'title': 'Profile',
      'icon': Icons.person_outline_outlined,
    },
  ];
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) async {
      await context.read<HomeViewModel>().bookingListApi();
      if (mounted) await context.read<HomeViewModel>().packageListApi();
    });
  }

  @override
  Widget build(BuildContext context) {
    return DrawerAnimationWidget(
      child: Scaffold(
        bottomNavigationBar: SizedBox(
          height: 74,
          child: BottomAppBar(
            color: MyColorTheme.whiteColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ...List.generate(
                  bottomList.length,
                  (i) {
                    var data = bottomList[i];
                    return BottomIconWidget(
                      title: data['title'],
                      icon: data['icon'],
                      iconColor: context.read<HomeViewModel>().currentIndex == i ? MyColorTheme.primaryColor : MyColorTheme.black87,
                      textColor: context.read<HomeViewModel>().currentIndex == i ? MyColorTheme.primaryColor : MyColorTheme.black87,
                      isVisible: context.read<HomeViewModel>().currentIndex == i,
                      onTap: () {
                        context.read<HomeViewModel>().currentIndexFxn(i);
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            GestureDetector(
              onTap: () {
                context.read<HomeViewModel>().animate();
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 30.0),
                child: Image.asset(
                  ImageConst.banner,
                  width: 33,
                  height: 33,
                ),
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
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 16,
                        color: MyColorTheme.darkBlueColor,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              //booking
              Visibility(
                visible: context.watch<HomeViewModel>().bookingList.isNotEmpty,
                replacement: const Center(
                  child: CircularProgressIndicator(
                    color: MyColorTheme.primaryLightColor,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...List.generate(context.watch<HomeViewModel>().bookingList.length, (i) {
                      CurrentBookingModel data = context.watch<HomeViewModel>().bookingList[i] ?? CurrentBookingModel();
                      return CurrentBookingWidget(
                        title: data.title,
                        fromDate: data.fromDate,
                        fromTime: data.fromTime,
                        toDate: data.toDate,
                        toTime: data.toTime,
                      );
                    }),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: MyText(
                  title: 'Packages',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 16,
                        color: MyColorTheme.darkBlueColor,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              Visibility(
                  visible: context.watch<HomeViewModel>().packageList.isNotEmpty,
                  replacement: const Center(
                    child: CircularProgressIndicator(
                      color: MyColorTheme.primaryLightColor,
                    ),
                  ),
                  child: Column(
                    children: [
                      ...List.generate(
                        context.watch<HomeViewModel>().packageList.length,
                        (i) {
                          PackageModel data = context.watch<HomeViewModel>().packageList[i] ?? PackageModel();
                          return PackagesCardWidget(
                            color: i % 2 == 0 ? MyColorTheme.primaryLightColor : MyColorTheme.lightBlueColor,
                            title: data.title,
                            description: data.desc,
                            price: data.price,
                          );
                        },
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

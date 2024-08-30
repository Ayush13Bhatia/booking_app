import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shimmer/shimmer.dart';
class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var baseColor = Colors.grey.withOpacity(0.04);
    var highLightColor = Colors.white;
    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highLightColor,
      child: const Padding(
        padding:  EdgeInsets.only(left: 30, right: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             ShimmerEffectWidget(
              width: double.maxFinite,
              height: 60,
            ),
             Gap(5),
            Row(
              children: [
                Expanded(
                  child:  ShimmerEffectWidget(
                    width: double.maxFinite,
                    height: 20,
                  ),
                ),
              ],
            ),
             Gap(5),
            Row(
              children: [
                Expanded(
                  child:  ShimmerEffectWidget(
                    width: double.maxFinite,
                    height: 20,
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


class ShimmerEffectWidget extends StatelessWidget {
  final double? height;
  final double? width;

  const ShimmerEffectWidget({super.key, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: Colors.grey,
      ),
    );
  }
}

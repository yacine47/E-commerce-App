import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/utils/my_colors.dart';
import 'package:ecommerce_app/core/widgets/item_has_padding.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomAdsLoadingWidget extends StatelessWidget {
  const CustomAdsLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ItemHasPadding(
      horPadding: kHorPadding,
      child: Shimmer.fromColors(
        baseColor: MyColors.shimmerBaseColor,
        highlightColor: MyColors.shimmerHighlightColor,
        child: Center(
          // child: AspectRatio(
          //   aspectRatio: 180 / 143,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              // height: 16,
              height: 129,
              width: MediaQuery.of(context).size.width,
              // height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  color: MyColors.textFieldColor,
                  borderRadius: BorderRadius.circular(12)),
            ),
          ),
          // ),
        ),
      ),
    );
  }
}

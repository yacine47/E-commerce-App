import 'package:ecommerce_app/core/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomLoadingCategoryItem extends StatelessWidget {
  const CustomLoadingCategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: MyColors.shimmerBaseColor,
      highlightColor: MyColors.shimmerHighlightColor,
      child: Container(
        // width: 96,

        constraints: const BoxConstraints(
          minWidth: 96,
        ),
        padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.black,
        ),
      ),
    );
  }
}

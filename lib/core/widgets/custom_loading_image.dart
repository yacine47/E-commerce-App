import 'package:ecommerce_app/core/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomLoadingImage extends StatelessWidget {
  const CustomLoadingImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Shimmer.fromColors(
        baseColor: MyColors.shimmerBaseColor,
        highlightColor: MyColors.shimmerHighlightColor,
        child: AspectRatio(
          aspectRatio: 180 / 143,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              height: 16,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: MyColors.textFieldColor,
                  borderRadius: BorderRadius.circular(12)),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:ecommerce_app/core/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomLoadingProductItem extends StatelessWidget {
  const CustomLoadingProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              12) // Specify the desired border radius here
          ),
      elevation: 0,
      shadowColor: Colors.transparent,
      color: MyColors.textFieldColor,
      child: Shimmer.fromColors(
        baseColor: MyColors.shimmerBaseColor,
      highlightColor: MyColors.shimmerHighlightColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 16,
                      width: MediaQuery.of(context).size.width * .8,
                      decoration: BoxDecoration(
                          color: MyColors.textFieldColor,
                          borderRadius: BorderRadius.circular(50)),
                    ),
                    Container(
                      height: 12,
                      width: MediaQuery.of(context).size.width * .2,
                      decoration: BoxDecoration(
                          color: MyColors.textFieldColor,
                          borderRadius: BorderRadius.circular(50)),
                    ),
                    Container(
                      height: 16,
                      width: MediaQuery.of(context).size.width * .4,
                      decoration: BoxDecoration(
                          color: MyColors.textFieldColor,
                          borderRadius: BorderRadius.circular(50)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

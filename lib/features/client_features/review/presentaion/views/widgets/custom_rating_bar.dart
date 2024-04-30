import 'package:ecommerce_app/core/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconly/iconly.dart';

class CustomRatingBar extends StatelessWidget {
  const CustomRatingBar({super.key, required this.itemSize});
  final double itemSize;
  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      direction: Axis.horizontal,
      itemSize: itemSize,
      itemCount: 5,
      rating: 4.5,
      unratedColor: Colors.grey.withOpacity(0.3),
      itemPadding: const EdgeInsets.symmetric(horizontal: 0),
      itemBuilder: (context, index) => Icon(
        IconlyBold.star,
        color: MyColors.starColor,
        size: 18,
      ),
    );
  }
}

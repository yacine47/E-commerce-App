import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/widgets/item_has_padding.dart';
import 'package:ecommerce_app/features/client_features/review/presentaion/views/widgets/app_bar_reviews.dart';
import 'package:ecommerce_app/features/client_features/review/presentaion/views/widgets/custom_review_item_list_view.dart';
import 'package:ecommerce_app/features/client_features/review/presentaion/views/widgets/custom_review_score.dart';
import 'package:flutter/material.dart';

class ProductReviewsViewBody extends StatelessWidget {
  const ProductReviewsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ItemHasPadding(
      horPadding: kHorPadding,
      child: ListView(
        children: const [
          SizedBox(height: 26),
          CustomAppBarViewAll(
            title: 'Reviews',
          ),
          SizedBox(height: 28),
          Text(
            'Rating and reviews are verified and are from people who use the same type of device that you use.',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 12),
          CustomReviewScore(),
          SizedBox(height: 16),
          CustomReviewItemListView(),
        ],
      ),
    );
  }
}

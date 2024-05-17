import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/models/product_model.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/core/widgets/custom_app_bar.dart';
import 'package:ecommerce_app/core/widgets/item_has_padding.dart';
import 'package:ecommerce_app/features/client_features/review/presentaion/views/widgets/custom_review_card.dart';
import 'package:ecommerce_app/features/client_features/review/presentaion/views/widgets/product_review_fetch_data.dart';
import 'package:flutter/material.dart';

class ProductReviewsViewBody extends StatelessWidget {
  const ProductReviewsViewBody({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return ItemHasPadding(
      horPadding: kHorPadding,
      child: ListView(
        children: [
          const SizedBox(height: 26),
          const CustomAppBar(
            title: 'Reviews',
          ),
          const SizedBox(height: 28),
          // Text(
          //   'Rating and reviews are verified and are from people who use the same type of device that you use.',
          //   style: TextStyle(
          //     fontSize: 14,
          //     fontWeight: FontWeight.w500,
          //   ),
          // ),
          // SizedBox(height: 12),
          // CustomReviewScore(),
          // SizedBox(height: 16),
          // ProductReviewFetchData(),

          CustomReviewCard(
            productModel: productModel,
          ),
          const SizedBox(height: 32),
          Text(
            'Reviews (${productModel.reviewsCount})',
            style: Styles.style18,
          ),
          const SizedBox(height: 12),
          const ProductReviewFetchData(),
        ],
      ),
    );
  }
}

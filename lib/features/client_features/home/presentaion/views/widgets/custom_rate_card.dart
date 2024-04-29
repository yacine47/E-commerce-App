import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/core/models/product_model.dart';
import 'package:ecommerce_app/features/client_features/review/presentaion/views/widgets/custom_rating_bar.dart';
import 'package:flutter/material.dart';

class CustomRateCard extends StatelessWidget {
  const CustomRateCard({super.key, required this.productModel, this.onTap});
  final ProductModel productModel;

  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomRatingBar(itemSize: 18),
        const SizedBox(
          width: 4,
        ),
        Text(
          '${productModel.rating}',
          style: Styles.style13,
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(' (${productModel.reviewsCount} reviews)',
              style: Styles.style13),
        ),
      ],
    );
  }
}

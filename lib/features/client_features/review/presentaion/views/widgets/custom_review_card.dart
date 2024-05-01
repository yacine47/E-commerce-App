import 'package:ecommerce_app/core/models/product_model.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/core/widgets/item_has_padding.dart';
import 'package:ecommerce_app/features/client_features/review/presentaion/views/widgets/custom_rating_bar.dart';
import 'package:flutter/material.dart';

class CustomReviewCard extends StatelessWidget {
  const CustomReviewCard({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(
            blurRadius: 10,
            color: Color.fromARGB(20, 0, 0, 0),
            offset: Offset(2.0, 4.0),
            blurStyle: BlurStyle.normal),
      ]),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                12) // Specify the desired border radius here
            ),
        elevation: 0,
        shadowColor: Colors.transparent,
        color: Colors.white,
        child: ItemHasPadding(
          verPadding: 18,
          horPadding: 38,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${productModel.rating}',
                style: Styles.style44,
              ),
              const SizedBox(width: 26),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   CustomRatingBar(itemSize: 24,rating: productModel.rating!),
                  const SizedBox(height: 12),
                  Text(
                    '${productModel.reviewsCount} reviews',
                    style: Styles.style14.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:ecommerce_app/core/utils/my_colors.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/core/widgets/custom_photo_profile.dart';
import 'package:ecommerce_app/core/widgets/item_has_padding.dart';
import 'package:ecommerce_app/features/client_features/review/data/models/review_model.dart';
import 'package:ecommerce_app/features/client_features/review/presentaion/views/widgets/custom_rating_bar.dart';
import 'package:flutter/material.dart';

class CustomReviewItem extends StatelessWidget {
  const CustomReviewItem({super.key, required this.reviewModel});

  final ReviewModel reviewModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CustomPhotoProfile(
                    photo: reviewModel.user!.photoProfile!,
                    size: 20,
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          '${reviewModel.user!.firstName!} ${reviewModel.user!.lastName!}',
                          style: Styles.style16.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          )),
                      Text('24-Aug-2023', style: Styles.style10),
                    ],
                  ),
                ],
              ),
              CustomRatingBar(
                rating: reviewModel.rating!,
                itemSize: 16,
              ),
            ],
          ),
          const SizedBox(height: 18),
          // const SizedBox(width: 12),
          // const SizedBox(height: 12),
          Text(reviewModel.comment!,
              style: Styles.style14.copyWith(color: Colors.black)),
          const SizedBox(height: 26),
          ItemHasPadding(
            horPadding: MediaQuery.of(context).size.width * .25,
            child: Divider(
              color: MyColors.borderCategoryColor,
            ),
          )
        ],
      ),
    );
  }
}

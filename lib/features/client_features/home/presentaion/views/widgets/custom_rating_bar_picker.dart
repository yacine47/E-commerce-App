import 'package:ecommerce_app/core/utils/my_colors.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/view_models/add_review_cubit/add_review_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconly/iconly.dart';

class CustomRatingBarPicker extends StatelessWidget {
  const CustomRatingBarPicker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: BlocProvider.of<AddReviewCubit>(context).rating,
      minRating: 1,
      direction: Axis.horizontal,
      itemCount: 5,
      itemSize: 52,
      // updateOnDrag: false,
      allowHalfRating: true,
      unratedColor: Colors.grey.withOpacity(0.3),
      itemPadding: const EdgeInsets.symmetric(horizontal: 1),
      itemBuilder: (context, index) => Icon(
        IconlyBold.star,
        color: MyColors.starColor,
        size: 18,
      ),
      onRatingUpdate: (rating) {
        BlocProvider.of<AddReviewCubit>(context).rating = rating;
      },
    );
  }
}

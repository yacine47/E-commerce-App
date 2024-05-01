import 'package:ecommerce_app/features/client_features/review/data/models/review_model.dart';
import 'package:ecommerce_app/features/client_features/review/presentaion/views/widgets/custom_review_item.dart';
import 'package:flutter/material.dart';

class CustomReviewItemListView extends StatelessWidget {
  const CustomReviewItemListView({super.key, required this.reviews});
  final List<ReviewModel> reviews;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: reviews.length,
      itemBuilder: (context, index) => CustomReviewItem(
        reviewModel: reviews[index],
      ),
    );
  }
}

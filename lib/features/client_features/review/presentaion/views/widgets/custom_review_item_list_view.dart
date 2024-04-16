import 'package:ecommerce_app/features/client_features/review/presentaion/views/widgets/custom_review_item.dart';
import 'package:flutter/material.dart';

class CustomReviewItemListView extends StatelessWidget {
  const CustomReviewItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 5,
      itemBuilder: (context, index) => const CustomReviewItem(),
    );
  }
}

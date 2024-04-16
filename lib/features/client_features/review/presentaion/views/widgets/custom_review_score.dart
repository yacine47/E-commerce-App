import 'package:ecommerce_app/features/client_features/review/presentaion/views/widgets/custom_linear_progress_indicator.dart';
import 'package:ecommerce_app/features/client_features/review/presentaion/views/widgets/custom_rating_bar.dart';
import 'package:flutter/material.dart';

class CustomReviewScore extends StatelessWidget {
  const CustomReviewScore({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              '4.7',
              style: TextStyle(
                fontSize: 56,
              ),
            ),
            const SizedBox(
              width: 64,
            ),
            Expanded(
              child: ListView.separated(
                  shrinkWrap: true,
                  reverse: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) =>
                      CustomLinearProgressIndicator(index: index + 1),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 0),
                  itemCount: 5),
            ),
          ],
        ),
        const CustomRatingBar(
          itemSize: 20,
        ),
        const Text(
          '12,611',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }
}

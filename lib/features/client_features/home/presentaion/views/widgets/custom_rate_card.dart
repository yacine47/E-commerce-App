import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/features/client_features/review/presentaion/views/widgets/custom_rating_bar.dart';
import 'package:flutter/material.dart';

class CustomRateCard extends StatelessWidget {
  const CustomRateCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomRatingBar(itemSize: 16),
        const SizedBox(
          width: 4,
        ),
        Text('4.5',
            style: Styles.style12
                .copyWith(color: Colors.black, fontWeight: FontWeight.w600)),
        Text(
          ' (1419 reviews)',
          style: Styles.style12
              .copyWith(color: Colors.black, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}

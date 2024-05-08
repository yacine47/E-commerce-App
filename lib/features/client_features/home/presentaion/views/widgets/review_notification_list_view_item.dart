import 'package:ecommerce_app/features/client_features/home/presentaion/views/widgets/review_notification_item.dart';
import 'package:flutter/material.dart';

class ReviewNotificationListViewItem extends StatelessWidget {
  const ReviewNotificationListViewItem({
    super.key,
    // required this.products,
  });
  // final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) => const ReviewNotificationItem(),
        separatorBuilder: (context, index) => const SizedBox(height: 2),
        itemCount: 3,
      ),
    );
  }
}

import 'package:ecommerce_app/features/client_features/home/data/models/notification_model.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/widgets/review_notification_item.dart';
import 'package:flutter/material.dart';

class ReviewNotificationListViewItem extends StatelessWidget {
  const ReviewNotificationListViewItem({
    super.key,
    required this.orderItemsDelivred,
  });
  final List<NotificationModel> orderItemsDelivred;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) => ReviewNotificationItem(
          notificationModel: orderItemsDelivred[index],
        ),
        separatorBuilder: (context, index) => const SizedBox(height: 2),
        itemCount: orderItemsDelivred.length,
      ),
    );
  }
}

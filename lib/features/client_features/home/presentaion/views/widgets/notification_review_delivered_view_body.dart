import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/widgets/custom_app_bar.dart';
import 'package:ecommerce_app/core/widgets/item_has_padding.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/widgets/review_notification_list_view_item.dart';
import 'package:flutter/material.dart';

class NotificationReviewDeliveredViewBody extends StatelessWidget {
  const NotificationReviewDeliveredViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const ItemHasPadding(
      horPadding: kHorPadding,
      child: Column(
        children: [
          SizedBox(height: 26),
          CustomAppBar(
            title: 'Reviews',
          ),
          SizedBox(height: 36),
          ReviewNotificationListViewItem()
        ],
      ),
    );
  }
}

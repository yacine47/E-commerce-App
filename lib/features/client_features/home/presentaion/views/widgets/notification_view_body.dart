import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/widgets/custom_app_bar.dart';
import 'package:ecommerce_app/core/widgets/item_has_padding.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/widgets/custom_notification_item.dart';
import 'package:flutter/material.dart';

class NotificationViewBody extends StatelessWidget {
  const NotificationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const ItemHasPadding(
      horPadding: kHorPadding,
      child: Column(
        children: [
          SizedBox(height: 9),
          CustomAppBar(
            title: 'Notifications',
          ),
          // const SizedBox(height: 54),
          SizedBox(height: 36),
          CustomNotificationItem()
        ],
      ),
    );
  }
}

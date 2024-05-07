import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/utils/my_colors.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/notification_reviews_delivered_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class CustomNotificationItem extends StatelessWidget {
  const CustomNotificationItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          GoRouter.of(context).push(NotificationReviewDeliveredView.path),
      child: Row(
        children: [
          Badge(
            backgroundColor: MyColors.primaryColor,
            label: const Text('4'),
            offset: Offset.zero,
            child: CircleAvatar(
              radius: 28,
              backgroundColor: MyColors.primaryColor2,
              child: const Iconify(
                kReviewIcon,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
          const SizedBox(width: 18),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Reviews',
                style: Styles.style18.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'Review of products delevried',
                style: Styles.style14.copyWith(
                  color: MyColors.hintColorTextField,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

import 'package:ecommerce_app/core/utils/my_colors.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/notification_view.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/widgets/notification_count_fetch_data.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';

class CustomBadgeNotification extends StatelessWidget {
  const CustomBadgeNotification({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Badge(
      backgroundColor: MyColors.primaryColor,
      label: const NoificationCountFetchData(),
      child: GestureDetector(
        onTap: () => GoRouter.of(context).push(NotificationView.path),
        child: const Icon(
          IconlyLight.notification,
          size: 26,
        ),
      ),
    );
  }
}

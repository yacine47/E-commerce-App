import 'package:ecommerce_app/features/client_features/home/presentaion/views/widgets/notification_review_delivered_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NotificationReviewDeliveredView extends StatelessWidget {
  const NotificationReviewDeliveredView({super.key});

  static String path = '/NotificationReviewDeliveredView';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: NotificationReviewDeliveredViewBody(),
      ),
    );
  }
}

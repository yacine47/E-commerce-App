import 'package:ecommerce_app/features/client_features/home/presentaion/views/widgets/notification_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});
  static String path = '/NotificationView';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: NotificationViewBody()),
    );
  }
}

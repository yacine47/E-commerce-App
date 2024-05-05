import 'package:ecommerce_app/features/client_features/profile/presentation/views/widgets/order_client_view_body.dart';
import 'package:flutter/material.dart';

class OrderClientView extends StatelessWidget {
  const OrderClientView({super.key});

  static String path = '/OrderClientView';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: OrderClientViewBody(),
      ),
    );
  }
}

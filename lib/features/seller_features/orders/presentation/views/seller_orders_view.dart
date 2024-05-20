import 'package:ecommerce_app/features/seller_features/orders/presentation/views/widgets/seller_order_view_body.dart';
import 'package:flutter/material.dart';

class SellerOrderView extends StatelessWidget {
  const SellerOrderView({super.key});

  static String path = '/SellerOrderView';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SellerOrderViewBody(),
      ),
    );
  }
}

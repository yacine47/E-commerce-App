import 'package:ecommerce_app/features/seller_features/orders/presentation/views/widgets/seller_order_datails_view_body.dart';
import 'package:flutter/material.dart';

class SellerOrderDetailsView extends StatelessWidget {
  const SellerOrderDetailsView({super.key});
  static String path = '/SellerOrderDetailsView';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Scaffold(
        body: SafeArea(child: SellerOrderDetailsViewBody()),
      ),
    );
  }
}

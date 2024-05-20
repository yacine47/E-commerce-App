import 'package:ecommerce_app/features/seller_features/product/presentaion/views/widgets/seller_product_view_body.dart';
import 'package:flutter/material.dart';

class SellerProductView extends StatelessWidget {
  const SellerProductView({super.key});

  static String path = '/SellerProductView';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SellerProductViewBody(),
      ),
    );
  }
}

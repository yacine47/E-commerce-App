import 'package:ecommerce_app/core/models/product_model.dart';
import 'package:ecommerce_app/features/client_features/cart/presentaion/views/widgets/checkout_view_body.dart';
import 'package:flutter/material.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key, required this.products});

  static String path = '/CheckoutView';

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: CheckoutViewBody(),
      ),
    );
  }
}

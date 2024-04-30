import 'package:ecommerce_app/features/client_features/cart/presentaion/views/widgets/checkout_view_body.dart';
import 'package:flutter/material.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  static String path = '/CheckoutView';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: CheckoutViewBody(),
      ),
    );
  }
}

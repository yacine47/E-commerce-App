import 'package:ecommerce_app/features/client_features/cart/presentaion/views/widgets/add_to_cart_view_body.dart';
import 'package:flutter/material.dart';

class AddToCartView extends StatelessWidget {
  const AddToCartView({super.key});
  static String path = '/AddToCartView';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: AddToCartViewBody(),
      ),
    );
  }
}

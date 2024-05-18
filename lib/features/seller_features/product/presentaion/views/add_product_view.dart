import 'package:ecommerce_app/features/seller_features/product/presentaion/views/widgets/add_product_view_body.dart';
import 'package:flutter/material.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  static String path = '/AddProductView';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: AddProductViewBody(),
      ),
    );
  }
}

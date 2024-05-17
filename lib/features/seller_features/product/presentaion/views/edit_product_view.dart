import 'package:ecommerce_app/features/seller_features/product/presentaion/views/widgets/edit_product_view_body.dart';
import 'package:flutter/material.dart';

class EditProductView extends StatelessWidget {
  const EditProductView({super.key});

  static String path = '/EditProductView';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: EditProductViewBody(),
      ),
    );
  }
}

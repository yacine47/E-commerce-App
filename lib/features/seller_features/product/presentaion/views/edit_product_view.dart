import 'package:ecommerce_app/core/models/product_model.dart';
import 'package:ecommerce_app/features/seller_features/product/presentaion/views/widgets/edit_product_view_body.dart';
import 'package:flutter/material.dart';

class EditProductView extends StatelessWidget {
  const EditProductView({super.key, required this.product});
  final ProductModel product;

  static String path = '/EditProductView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: EditProductViewBody(product: product),
      ),
    );
  }
}

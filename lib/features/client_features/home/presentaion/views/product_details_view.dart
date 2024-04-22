import 'package:ecommerce_app/features/client_features/home/data/models/product_model.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/widgets/product_details_view_body.dart';
import 'package:flutter/material.dart';

class ProductDetailsView extends StatelessWidget {
  static String path = '/ProductDetailsView';
  const ProductDetailsView({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ProductDetailsViewBody(
          productModel: productModel,
        ),
      ),
    );
  }
}

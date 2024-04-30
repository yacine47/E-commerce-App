import 'package:ecommerce_app/core/models/product_model.dart';
import 'package:ecommerce_app/features/client_features/review/presentaion/views/widgets/product_reviews_view_body.dart';
import 'package:flutter/material.dart';

class ProductReviewsView extends StatelessWidget {
  const ProductReviewsView({super.key, required this.productModel});
  static String path = '/ProductReviewsViewBody';
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ProductReviewsViewBody(
          productModel: productModel,
        ),
      ),
    );
  }
}

import 'package:ecommerce_app/features/client_features/review/presentaion/views/widgets/product_reviews_view_body.dart';
import 'package:flutter/material.dart';

class ProductReviewsView extends StatelessWidget {
  const ProductReviewsView({super.key});
  static String path =  '/ProductReviewsViewBody';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: ProductReviewsViewBody()),
    );
  }
}

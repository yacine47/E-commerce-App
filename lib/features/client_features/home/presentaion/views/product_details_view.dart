import 'package:ecommerce_app/features/client_features/home/presentaion/views/widgets/product_details_view_body.dart';
import 'package:flutter/material.dart';

class ProductDetailsView extends StatelessWidget {
  static String path = '/ProductDetailsView';
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: ProductDetailsViewBody(),
      ),
    );
  }
}

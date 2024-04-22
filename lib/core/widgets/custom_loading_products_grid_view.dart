import 'package:ecommerce_app/core/widgets/custom_loading_product_item.dart';
import 'package:flutter/material.dart';

class CustomLoadingProductsGridView extends StatelessWidget {
  const CustomLoadingProductsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 6,
        crossAxisSpacing: 0,
        childAspectRatio: 3 / 4,
        // childAspectRatio: 3.5 / 4,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) => const CustomLoadingProductItem(),
        childCount: 5,
      ),
    );
    // itemCount: 10,
    // itemBuilder: (context, index) => const ProductItem(),
  }
}

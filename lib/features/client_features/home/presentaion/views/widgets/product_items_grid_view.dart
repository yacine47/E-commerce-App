import 'package:ecommerce_app/core/models/product_model.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/product_details_view.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductItemsGridView extends StatelessWidget {
  const ProductItemsGridView({
    super.key,
    required this.products,
  });
  final List<ProductModel> products;

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
        (context, index) => ProductItem(
          productModel: products[index],
          onTap: () => GoRouter.of(context)
              .push(ProductDetailsView.path, extra: products[index]),
        ),
        childCount: products.length,
      ),
    );
  }
}

import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/models/product_model.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/widgets/product_items_grid_view.dart';
import 'package:flutter/material.dart';

class ProductItemsResultFetchData extends StatelessWidget {
  const ProductItemsResultFetchData({super.key, required this.products});

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
        // ProductByCategoryCubit
        padding: const EdgeInsets.symmetric(
          horizontal: kHorPadding,
        ),
        sliver: ProductItemsGridView(
          products: products,
        ));
  }
}

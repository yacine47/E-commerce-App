import 'package:ecommerce_app/core/models/product_model.dart';
import 'package:flutter/material.dart';

import 'seller_product_item.dart';

class ProductSellerItemsListView extends StatelessWidget {
  const ProductSellerItemsListView({
    super.key,
    required this.products,
  });
  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) =>
            SellerProductItem(product: products[index]),
        itemCount: products.length,
      ),
    );
  }
}

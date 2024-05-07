

import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/models/product_model.dart';
import 'package:ecommerce_app/features/client_features/profile/presentation/views/widgets/order_item.dart';
import 'package:flutter/material.dart';

class OrderItemsListView extends StatelessWidget {
  const OrderItemsListView({
    super.key,
    required this.products,
  });
  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: kHorPadding, vertical: 8),
      itemBuilder: (context, index) => OrderItem(
        product: products[index],
      ),
      separatorBuilder: (context, index) => const SizedBox(height: 0),
      itemCount: products.length,
    );
  }
}

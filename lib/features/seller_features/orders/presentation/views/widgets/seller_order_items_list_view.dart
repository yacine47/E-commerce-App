import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/models/product_model.dart';
import 'package:ecommerce_app/features/seller_features/orders/presentation/views/widgets/seller_order_item.dart';
import 'package:flutter/material.dart';

class SellerOrderItemsListView extends StatelessWidget {
  const SellerOrderItemsListView({
    super.key,
    required this.products,
  });
  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: kHorPadding, vertical: 0),
      itemBuilder: (context, index) => SellerOrderItem(
        product: products[index],
      ),
      separatorBuilder: (context, index) => const SizedBox(height: 0),
      itemCount: products.length,
    );
  }
}

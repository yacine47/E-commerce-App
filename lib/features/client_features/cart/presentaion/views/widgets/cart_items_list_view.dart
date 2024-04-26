import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/models/product_model.dart';
import 'package:ecommerce_app/features/client_features/cart/presentaion/views/widgets/cart_items.dart';
import 'package:flutter/material.dart';

class CartItemsListView extends StatelessWidget {
  const CartItemsListView({
    super.key,
    required this.products,
  });
  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        shrinkWrap: true,
        padding:
            const EdgeInsets.symmetric(horizontal: kHorPadding, vertical: 8),
        itemBuilder: (context, index) => CartItems(
          product: products[index],
        ),
        separatorBuilder: (context, index) => const SizedBox(height: 0),
        itemCount: products.length,
      ),
    );
  }
}

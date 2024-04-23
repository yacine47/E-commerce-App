import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/features/client_features/cart/presentaion/views/widgets/cart_items.dart';
import 'package:flutter/material.dart';

class CartItemsListView extends StatelessWidget {
  const CartItemsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        shrinkWrap: true,
        padding:
            const EdgeInsets.symmetric(horizontal: kHorPadding, vertical: 8),
        itemBuilder: (context, index) => const CartItems(),
        separatorBuilder: (context, index) => const SizedBox(height: 0),
        itemCount: 3,
      ),
    );
  }
}

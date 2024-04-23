import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/features/client_features/cart/presentaion/views/widgets/add_to_cart_items.dart';
import 'package:flutter/material.dart';

class AddToCartViewBody extends StatelessWidget {
  const AddToCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 9),
        Center(
          child: Text(
            'Cart',
            style: Styles.style24,
            textAlign: TextAlign.center,
          ),
        ),
        // const SizedBox(height: 54),
        const SizedBox(height: 26),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(
                horizontal: kHorPadding, vertical: 8),
            itemBuilder: (context, index) => const AddToCartItems(),
            separatorBuilder: (context, index) => const SizedBox(height: 0),
            itemCount: 3,
          ),
        ),
      ],
    );
  }
}

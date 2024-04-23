import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/core/widgets/custom_button_submit.dart';
import 'package:ecommerce_app/core/widgets/item_has_padding.dart';
import 'package:ecommerce_app/features/client_features/cart/presentaion/views/widgets/cart_items_list_view.dart';
import 'package:ecommerce_app/features/client_features/cart/presentaion/views/widgets/total_price_cart.dart';
import 'package:flutter/material.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

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
          child: Column(
            children: [
              const CartItemsListView(),
              const SizedBox(height: 16),
              const TotalPriceCart(),
              const SizedBox(height: 16),
              ItemHasPadding(
                horPadding: kHorPadding,
                child: CustomButtonSubmit(
                  title: 'Checkout',
                  onPressed: () {},
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ],
    );
  }
}

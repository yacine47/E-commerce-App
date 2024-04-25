import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/core/widgets/custom_button_submit.dart';
import 'package:ecommerce_app/core/widgets/go_back_button.dart';
import 'package:ecommerce_app/core/widgets/item_has_padding.dart';
import 'package:ecommerce_app/features/client_features/cart/presentaion/views/widgets/cart_item_fetch_data.dart';
import 'package:ecommerce_app/features/client_features/cart/presentaion/views/widgets/total_price_cart.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 23),
        ItemHasPadding(
          horPadding: kHorPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GoRouter.of(context).canPop()
                  ? const GoBackButton()
                  : const SizedBox(),
              Text(
                'Cart',
                style: Styles.style24,
                textAlign: TextAlign.center,
              ),
              const SizedBox(),
            ],
          ),
        ),
        // const SizedBox(height: 54),
        const SizedBox(height: 26),
        Expanded(
          child: Column(
            children: [
              const CartItemFetchData(),
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

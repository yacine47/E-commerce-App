

import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/widgets/custom_button_submit.dart';
import 'package:ecommerce_app/core/widgets/item_has_padding.dart';
import 'package:ecommerce_app/features/client_features/cart/presentaion/views/widgets/total_price_checkout.dart';
import 'package:flutter/material.dart';

class CheckoutBottomBar extends StatelessWidget {
  const CheckoutBottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TotalPriceCheckout(),
        const SizedBox(height: 8),
        ItemHasPadding(
          horPadding: kHorPadding,
          child: CustomButtonSubmit(
            title: 'Checkout',
            onPressed: () {
              // GoRouter.of(context).push(CheckoutView.path);
            },
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

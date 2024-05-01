import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/models/product_model.dart';
import 'package:ecommerce_app/core/widgets/custom_button_submit.dart';
import 'package:ecommerce_app/core/widgets/item_has_padding.dart';
import 'package:ecommerce_app/features/client_features/cart/presentaion/views/widgets/total_price_cart.dart';
import 'package:flutter/material.dart';

class CheckoutBottomBar extends StatelessWidget {
  const CheckoutBottomBar({
    super.key, required this.products,
  });
  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         TotalPriceCart(
          products: products,
        ),
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

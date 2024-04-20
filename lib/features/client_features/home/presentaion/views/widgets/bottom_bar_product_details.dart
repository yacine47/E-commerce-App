import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/core/widgets/item_has_padding.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/widgets/custom_button_add_to_cart.dart';
import 'package:flutter/material.dart';

class BottomBarProductDetails extends StatelessWidget {
  const BottomBarProductDetails({
    super.key,
    this.onPressed,
  });
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return ItemHasPadding(
      horPadding: kHorPadding,
      verPadding: 8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '46000 DZD',
            style: Styles.style24.copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .5,
            child: CustomButtonAddToCart(
              onPressed: onPressed,
            ),
          ),
        ],
      ),
    );
  }
}

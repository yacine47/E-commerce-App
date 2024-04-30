


import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/utils/my_colors.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/core/widgets/item_has_padding.dart';
import 'package:flutter/material.dart';

class CheckoutPolices extends StatelessWidget {
  const CheckoutPolices({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColors.gapColor,
      child: ItemHasPadding(
        horPadding: kHorPadding,
        verPadding: 4,
        child: Text(
          'By clicking Place Order, I acknowledge that I will assume all responsibility as per the terms and policies.',
          style: Styles.style10,
        ),
      ),
    );
  }
}




import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/utils/my_colors.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/core/widgets/item_has_padding.dart';
import 'package:flutter/material.dart';

class TotalPriceCart extends StatelessWidget {
  const TotalPriceCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ItemHasPadding(
      horPadding: kHorPadding + 8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'Total Price :',
            style: Styles.style16.copyWith(
              fontWeight: FontWeight.w500,
              color: MyColors.hintColorTextField,
            ),
          ),
          Text(
            '15,000 DA',
            style: Styles.style16.copyWith(
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

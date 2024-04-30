import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/functions/get_price_format.dart';
import 'package:ecommerce_app/core/models/product_model.dart';
import 'package:ecommerce_app/core/utils/my_colors.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/core/widgets/item_has_padding.dart';
import 'package:flutter/material.dart';

class TotalPriceCart extends StatelessWidget {
  const TotalPriceCart({
    super.key,
    required this.products,
  });

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return ItemHasPadding(
      horPadding: kHorPadding + 8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'Total Price :  ',
            style: Styles.style16.copyWith(
              fontWeight: FontWeight.w500,
              color: MyColors.hintColorTextField,
            ),
          ),
          Text(
            "${getPriceFormat(calculTotalPrice(context))} DA",
            style: Styles.style18.copyWith(
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  int calculTotalPrice(context) {
    int sum = 0;
    for (var element in products) {
      sum += element.price! * element.quantityCartItem!;
    }

    return sum;
  }
}

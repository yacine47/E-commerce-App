import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/models/product_model.dart';
import 'package:ecommerce_app/core/utils/my_colors.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/core/widgets/item_has_padding.dart';
import 'package:ecommerce_app/features/client_features/cart/presentaion/view_models/product_cart_cubit/product_cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TotalPriceCheckout extends StatelessWidget {
  const TotalPriceCheckout({
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
            'Total Price :  ',
            style: Styles.style16.copyWith(
              fontWeight: FontWeight.w500,
              color: MyColors.hintColorTextField,
            ),
          ),
          Text(
            "999999 DA",
            style: Styles.style18.copyWith(
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

// ${getPriceFormat(calculTotalPrice(context))}
  int calculTotalPrice(context) {
    List<ProductModel> products =
        BlocProvider.of<ProductCartCubit>(context).cartProducts;
    int sum = 0;
    for (var element in products) {
      sum += element.price! * element.quantityCartItem!;
    }

    return sum;
  }
}

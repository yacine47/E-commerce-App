import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/functions/get_price_format.dart';
import 'package:ecommerce_app/core/utils/styles.dart';
import 'package:ecommerce_app/core/widgets/item_has_padding.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/view_models/add_to_cart/add_to_cart_cubit.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/widgets/custom_button_add_to_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomBarProductDetails extends StatelessWidget {
  const BottomBarProductDetails({
    super.key,
    this.onPressed,
    required this.price,
  });
  final VoidCallback? onPressed;
  final int price;
  @override
  Widget build(BuildContext context) {
    return ItemHasPadding(
      horPadding: kHorPadding,
      verPadding: 8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${getPriceFormat(price)} DA',
            style: Styles.style24.copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .5,
            child: BlocBuilder<AddToCartCubit, AddToCartState>(
              builder: (context, state) {
                return CustomButtonAddToCart(
                  isLoadingState: state is AddToCartLoading,
                  onPressed: onPressed,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

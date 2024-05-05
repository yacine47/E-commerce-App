import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/widgets/custom_app_bar.dart';
import 'package:ecommerce_app/core/widgets/custom_failure_widget.dart';
import 'package:ecommerce_app/core/widgets/custom_loading_widget.dart';
import 'package:ecommerce_app/core/widgets/item_has_padding.dart';
import 'package:ecommerce_app/features/client_features/cart/presentaion/view_models/product_cart_cubit/product_cart_cubit.dart';
import 'package:ecommerce_app/features/client_features/cart/presentaion/views/widgets/product_cart_items_success_response_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 23),
        const ItemHasPadding(
          horPadding: kHorPadding,
          child: CustomAppBar(
            title: 'Cart',
          ),
        ),
        // const SizedBox(height: 54),
        const SizedBox(height: 26),
        BlocBuilder<ProductCartCubit, ProductCartState>(
          builder: (context, state) {
            if (state is ProductCartSuccess) {
              return ProductCartSuccessResponseWidget(
                products: state.products,
              );
            } else if (state is ProductCartFailure) {
              return CustomFailureWidget(errMessage: state.errMessage);
            }
            return const CustomLoadingWidget();
          },
        ),
      ],
    );
  }
}

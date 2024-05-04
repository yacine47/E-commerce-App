import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/models/product_model.dart';
import 'package:ecommerce_app/core/utils/my_assets.dart';
import 'package:ecommerce_app/core/widgets/custom_app_bar.dart';
import 'package:ecommerce_app/core/widgets/custom_button_submit.dart';
import 'package:ecommerce_app/core/widgets/custom_failure_widget.dart';
import 'package:ecommerce_app/core/widgets/custom_loading_widget.dart';
import 'package:ecommerce_app/core/widgets/item_has_padding.dart';
import 'package:ecommerce_app/features/client_features/cart/presentaion/view_models/product_cart_cubit/product_cart_cubit.dart';
import 'package:ecommerce_app/features/client_features/cart/presentaion/views/checkout_view.dart';
import 'package:ecommerce_app/features/client_features/cart/presentaion/views/widgets/cart_items_list_view.dart';
import 'package:ecommerce_app/features/client_features/cart/presentaion/views/widgets/total_price_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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

class ProductCartSuccessResponseWidget extends StatelessWidget {
  const ProductCartSuccessResponseWidget({
    super.key,
    required this.products,
  });
  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return products.isNotEmpty
        ? Expanded(
            child: Column(
              children: [
                CartItemsListView(
                  products: products,
                ),
                const SizedBox(height: 16),
                TotalPriceCart(products: products),
                const SizedBox(height: 16),
                ItemHasPadding(
                  horPadding: kHorPadding,
                  child: CustomButtonSubmit(
                    title: 'Checkout',
                    onPressed: () {
                      GoRouter.of(context).push(
                        CheckoutView.path,
                        extra: products,
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          )
        : SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(MyAssets.cartEmpty),
              ],
            ),
          );
  }
}

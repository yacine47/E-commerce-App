import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/functions/calcul_total_price.dart';
import 'package:ecommerce_app/core/models/product_model.dart';
import 'package:ecommerce_app/core/widgets/custom_button_submit.dart';
import 'package:ecommerce_app/core/widgets/custom_loading_widget.dart';
import 'package:ecommerce_app/core/widgets/item_has_padding.dart';
import 'package:ecommerce_app/features/client_features/cart/presentaion/view_models/coupon_cart_cubit/coupon_cart_cubit.dart';
import 'package:ecommerce_app/features/client_features/cart/presentaion/view_models/create_address_cubit/create_address_cubit.dart';
import 'package:ecommerce_app/features/client_features/cart/presentaion/view_models/create_order_cubit/create_order_cubit.dart';
import 'package:ecommerce_app/features/client_features/cart/presentaion/views/widgets/total_price_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CheckoutBottomBar extends StatelessWidget {
  const CheckoutBottomBar({
    super.key,
    required this.products,
  });
  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<CouponCartCubit, CouponCartState>(
          builder: (context, state) {
            if (state is CouponCartLoading) {
              return const CustomLoadingWidget();
            } else if (state is CouponCartSuccess) {
              BlocProvider.of<CreateOrderCubit>(context).totalPrice =
                  state.couponCartModel.totalPrice;
              return TotalPriceCart(
                products: products,
                totalPriceWithCoupon: state.couponCartModel.totalPrice,
              );
            }
            BlocProvider.of<CreateOrderCubit>(context).totalPrice =
                calculTotalPrice(context, products);
            return TotalPriceCart(
              products: products,
            );
          },
        ),
        const SizedBox(height: 8),
        ItemHasPadding(
          horPadding: kHorPadding,
          child: BlocConsumer<CreateOrderCubit, CreateOrderState>(
            listener: (context, state) {
              if (state is CreateOrderSuccess) {
                GoRouter.of(context).pop();
              }
            },
            builder: (context, state) {
              return CustomButtonSubmit(
                isLoadingState: state is CreateOrderLoading,
                title: 'Checkout',
                onPressed: () {
                  BlocProvider.of<CreateOrderCubit>(context).addressId =
                      BlocProvider.of<CreateAddressCubit>(context)
                          .addressModel!
                          .id!
                          .toString();
                  BlocProvider.of<CreateOrderCubit>(context).createNewOrder();
                },
              );
            },
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

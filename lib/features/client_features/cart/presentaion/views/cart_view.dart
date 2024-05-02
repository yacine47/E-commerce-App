import 'package:ecommerce_app/core/utils/service_locator.dart';
import 'package:ecommerce_app/features/client_features/cart/data/repos/cart_repo_impl.dart';
import 'package:ecommerce_app/features/client_features/cart/presentaion/view_models/coupon_cart_cubit/coupon_cart_cubit.dart';
import 'package:ecommerce_app/features/client_features/cart/presentaion/view_models/delete_from_cart/delete_from_cart_cubit.dart';
import 'package:ecommerce_app/features/client_features/cart/presentaion/view_models/product_cart_cubit/product_cart_cubit.dart';
import 'package:ecommerce_app/features/client_features/cart/presentaion/view_models/quantity_cart_item_cubit/quantity_cart_item_cubit.dart';
import 'package:ecommerce_app/features/client_features/cart/presentaion/views/widgets/cart_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});
  static String path = '/AddToCartView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: MultiBlocProvider(
          providers: [
            
            BlocProvider<CouponCartCubit>(
              create: (context) =>
                  CouponCartCubit(getIt.get<CartRepoImpl>()),
            ),
            BlocProvider<DeleteFromCartCubit>(
              create: (context) =>
                  DeleteFromCartCubit(getIt.get<CartRepoImpl>()),
            ),
            BlocProvider<ProductCartCubit>(
              create: (context) =>
                  ProductCartCubit(getIt.get<CartRepoImpl>())..getProductCart(),
            ),
            BlocProvider<QuantityCartItemCubit>(
              create: (context) =>
                  QuantityCartItemCubit(getIt.get<CartRepoImpl>()),
            ),
          ],
          child: const CartViewBody(),
        ),
      ),
    );
  }
}

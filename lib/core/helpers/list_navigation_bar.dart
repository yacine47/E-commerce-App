import 'package:ecommerce_app/core/utils/service_locator.dart';
import 'package:ecommerce_app/core/widgets/profil_view_body.dart';
import 'package:ecommerce_app/features/client_features/cart/data/repos/cart_repo_impl.dart';
import 'package:ecommerce_app/features/client_features/cart/presentaion/view_models/product_cart_cubit.dart';
import 'package:ecommerce_app/features/client_features/cart/presentaion/views/cart_view.dart';
import 'package:ecommerce_app/features/client_features/favorite/data/repos/favorite_repo_impl.dart';
import 'package:ecommerce_app/features/client_features/favorite/presentaion/view_models/favorite_product/favorite_product_cubit.dart';
import 'package:ecommerce_app/features/client_features/favorite/presentaion/views/widgets/favorite_view_body.dart';
import 'package:ecommerce_app/features/client_features/home/data/repos/home_client_repo_impl.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/view_models/category_cubit/category_cubit.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/view_models/product_by_category_cubit.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/widgets/home_client_view_body.dart';
import 'package:ecommerce_app/features/seller_features/home/presentation/views/widgets/home_seller_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class NavigationView {
  static List<Widget> navigationViewsClient = [
    MultiBlocProvider(
      providers: [
        BlocProvider<ProductByCategoryCubit>(
          create: (context) =>
              ProductByCategoryCubit(getIt.get<HomeClientRepoImpl>())
                ..getProductByCategory(1),
        ),
        BlocProvider<CategoryCubit>(
          create: (context) => CategoryCubit(getIt.get<HomeClientRepoImpl>())
            ..getAllCategories(),
        ),
      ],
      child: const HomeClientViewBody(),
    ),
    BlocProvider(
      create: (context) => FavoriteProductCubit(getIt.get<FavoriteRepoImpl>())
        ..getFavoriteProducts(),
      child: const FavoriteViewBody(),
    ),
    MultiBlocProvider(
      providers: [
        BlocProvider<ProductCartCubit>(
          create: (context) =>
              ProductCartCubit(getIt.get<CartRepoImpl>())..getProductCart(),
        ),
      ],
      child: const CartView(),
    ),
    const ProfileViewBody(),
  ];

  static List<Widget> navigationViewSeller = [
    const HomeSellerViewBody(),
    const HomeSellerViewBody(),
    // const AddToCartView(),
    const ProfileViewBody(),
  ];
}

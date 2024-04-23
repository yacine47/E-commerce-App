import 'package:ecommerce_app/core/utils/service_locator.dart';
import 'package:ecommerce_app/core/widgets/profil_view_body.dart';
import 'package:ecommerce_app/features/client_features/cart/presentaion/views/cart_view.dart';
import 'package:ecommerce_app/features/client_features/home/data/repos/home_client_repo_impl.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/view_models/all_product/all_product_cubit.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/view_models/category_cubit/category_cubit.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/widgets/home_client_view_body.dart';
import 'package:ecommerce_app/features/seller_features/home/presentation/views/widgets/home_seller_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class NavigationView {
  static List<Widget> navigationViewsClient = [
    MultiBlocProvider(
      providers: [
        BlocProvider<CategoryCubit>(
          create: (context) => CategoryCubit(getIt.get<HomeClientRepoImpl>())
            ..getAllCategories(),
        ),
        BlocProvider<AllProductCubit>(
          create: (context) => AllProductCubit(getIt.get<HomeClientRepoImpl>())
            ..getAllProducts(),
        ),
      ],
      child: const HomeClientViewBody(),
    ),
    const HomeClientViewBody(),
    const CartView(),
    const ProfileViewBody(),
  ];

  static List<Widget> navigationViewSeller = [
    const HomeSellerViewBody(),
    const HomeSellerViewBody(),
    // const AddToCartView(),
    const ProfileViewBody(),
  ];
}

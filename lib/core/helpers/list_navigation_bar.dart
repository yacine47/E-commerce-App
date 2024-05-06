import 'package:ecommerce_app/core/utils/service_locator.dart';
import 'package:ecommerce_app/features/client_features/cart/presentaion/views/cart_view.dart';
import 'package:ecommerce_app/features/client_features/favorite/presentaion/views/widgets/favorite_view_body.dart';
import 'package:ecommerce_app/features/client_features/home/data/repos/home_client_repo_impl.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/view_models/advertising_today_cubit/advertising_today_cubit.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/view_models/category_cubit/category_cubit.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/view_models/product_by_category/product_by_category_cubit.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/widgets/home_client_view_body.dart';
import 'package:ecommerce_app/features/client_features/profile/data/repos/profile_client_repo_impl.dart';
import 'package:ecommerce_app/features/client_features/profile/presentation/view_models/logout_cubit/logout_cubit.dart';
import 'package:ecommerce_app/features/client_features/profile/presentation/views/profile_client_view_body.dart';
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
        BlocProvider<AdvertisingTodayCubit>(
          create: (context) =>
              AdvertisingTodayCubit(getIt.get<HomeClientRepoImpl>())
                ..getAdsToday(),
        ),
      ],
      child: const HomeClientViewBody(),
    ),
    const FavoriteViewBody(),
    const CartView(),
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LogoutCubit(getIt.get<ProfileClientRepoImpl>()),
        ),
      ],
      child: const ProfileClientViewBody(),
    ),
  ];

  static List<Widget> navigationViewSeller = [
    const HomeSellerViewBody(),
    const HomeSellerViewBody(),
    // const AddToCartView(),
    const ProfileClientViewBody(),
  ];
}

import 'package:ecommerce_app/core/functions/init_route.dart';
import 'package:ecommerce_app/core/utils/service_locator.dart';
import 'package:ecommerce_app/features/authentication/data/models/user_model.dart';
import 'package:ecommerce_app/features/authentication/data/repos/auth_repo_impl.dart';
import 'package:ecommerce_app/features/authentication/presentation/view_models/login_cubit/login_cubit.dart';
import 'package:ecommerce_app/features/authentication/presentation/view_models/register_cubit/register_cubit.dart';
import 'package:ecommerce_app/features/authentication/presentation/views/login_view.dart';
import 'package:ecommerce_app/features/authentication/presentation/views/sign_up_view.dart';
import 'package:ecommerce_app/features/client_features/cart/presentaion/views/cart_view.dart';
import 'package:ecommerce_app/core/models/product_model.dart';
import 'package:ecommerce_app/features/client_features/favorite/presentaion/views/favorite_view.dart';
import 'package:ecommerce_app/features/client_features/home/data/repos/home_client_repo_impl.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/view_models/add_to_cart/add_to_cart_cubit.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/view_models/add_to_favorite/add_to_favorite_cubit.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/view_models/check_proudct/check_product_cubit.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/view_models/delete_from_favorite_cubit/delete_from_favorite_cubit.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/home_client_view.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/product_details_view.dart';
import 'package:ecommerce_app/features/client_features/review/data/repos/review_repo_impl.dart';
import 'package:ecommerce_app/features/client_features/review/presentaion/view_models/review_product_cubit/review_product_cubit.dart';
import 'package:ecommerce_app/features/client_features/review/presentaion/views/product_reviews_view.dart';
import 'package:ecommerce_app/features/client_features/search/data/models/result_model.dart';
import 'package:ecommerce_app/features/client_features/search/data/repos/search_repo_impl.dart';
import 'package:ecommerce_app/features/client_features/search/presentaion/view_models/search_product_cubit/search_product_cubit.dart';
import 'package:ecommerce_app/features/client_features/search/presentaion/views/result_product_view.dart';
import 'package:ecommerce_app/features/client_features/search/presentaion/views/search_product_view.dart';
import 'package:ecommerce_app/features/introduction_screen/presentation/views/introduction_screen_view.dart';
import 'package:ecommerce_app/features/seller_features/home/presentation/views/home_seller_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final router = GoRouter(
    initialLocation: initRoute(),
    routes: [
      GoRoute(
        path: IntroductionScreenView.path,
        builder: (context, state) => const IntroductionScreenView(),
      ),
      GoRoute(
        path: LoginView.path,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              LoginCubit(getIt.get<AuthRepoImpl>(), getIt.get<UserModel>()),
          child: const LoginView(),
        ),
      ),
      GoRoute(
        path: SignUpView.path,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              RegisterCubit(getIt.get<AuthRepoImpl>(), getIt.get<UserModel>()),
          child: const SignUpView(),
        ),
      ),
      GoRoute(
        path: HomeClientView.path,
        builder: (context, state) => const HomeClientView(),
      ),
      GoRoute(
        path: HomeSellerView.path,
        builder: (context, state) => const HomeSellerView(),
      ),
      GoRoute(
        path: ProductDetailsView.path,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider<AddToFavoriteCubit>(
              create: (context) =>
                  AddToFavoriteCubit(getIt.get<HomeClientRepoImpl>()),
            ),
            BlocProvider<CheckProductCubit>(
              create: (context) =>
                  CheckProductCubit(getIt.get<HomeClientRepoImpl>()),
            ),
            BlocProvider<AddToCartCubit>(
              create: (context) =>
                  AddToCartCubit(getIt.get<HomeClientRepoImpl>()),
            ),
            BlocProvider<DeleteFromFavoriteCubit>(
              create: (context) =>
                  DeleteFromFavoriteCubit(getIt.get<HomeClientRepoImpl>()),
            ),
          ],
          child: ProductDetailsView(productModel: state.extra as ProductModel),
        ),
      ),
      GoRoute(
        path: ProductReviewsView.path,
        builder: (context, state) => BlocProvider(
          create: (context) => ReviewProductCubit(
              getIt.get<ReviewRepoImpl>(), state.extra as int)
            ..getFavoriteProducts(),
          child: const ProductReviewsView(),
        ),
      ),
      GoRoute(
        path: CartView.path,
        builder: (context, state) => const CartView(),
      ),
      GoRoute(
        path: FavoriteView.path,
        builder: (context, state) => const FavoriteView(),
      ),
      GoRoute(
        path: ResultProductView.path,
        builder: (context, state) =>
            ResultProductView(resultModel: state.extra as ResultModel),
      ),
      GoRoute(
        path: SearchProductView.path,
        builder: (context, state) => BlocProvider<SearchProductCubit>(
          create: (context) => SearchProductCubit(getIt.get<SearchRepoImpl>()),
          child: const SearchProductView(),
        ),
      ),
    ],
  );
}

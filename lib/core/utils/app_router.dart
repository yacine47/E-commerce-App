import 'package:ecommerce_app/core/functions/init_route.dart';
import 'package:ecommerce_app/core/utils/service_locator.dart';
import 'package:ecommerce_app/features/authentication/data/models/user_model.dart';
import 'package:ecommerce_app/features/authentication/data/repos/auth_repo_impl.dart';
import 'package:ecommerce_app/features/authentication/presentation/view_models/login_cubit/login_cubit.dart';
import 'package:ecommerce_app/features/authentication/presentation/view_models/register_cubit/register_cubit.dart';
import 'package:ecommerce_app/features/authentication/presentation/views/login_view.dart';
import 'package:ecommerce_app/features/authentication/presentation/views/sign_up_view.dart';
import 'package:ecommerce_app/features/client_features/cart/data/repos/cart_repo_impl.dart';
import 'package:ecommerce_app/features/client_features/cart/presentaion/view_models/coupon_cart_cubit/coupon_cart_cubit.dart';
import 'package:ecommerce_app/features/client_features/cart/presentaion/view_models/create_order_cubit/create_order_cubit.dart';
import 'package:ecommerce_app/features/client_features/cart/presentaion/view_models/quantity_cart_item_cubit/quantity_cart_item_cubit.dart';
import 'package:ecommerce_app/features/client_features/cart/presentaion/views/address_view.dart';
import 'package:ecommerce_app/features/client_features/cart/presentaion/views/cart_view.dart';
import 'package:ecommerce_app/core/models/product_model.dart';
import 'package:ecommerce_app/features/client_features/cart/presentaion/views/checkout_view.dart';
import 'package:ecommerce_app/features/client_features/favorite/presentaion/views/favorite_view.dart';
import 'package:ecommerce_app/features/client_features/home/data/models/advertising_model.dart';
import 'package:ecommerce_app/features/client_features/home/data/models/notification_model.dart';
import 'package:ecommerce_app/features/client_features/home/data/repos/home_client_repo_impl.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/view_models/add_review_cubit/add_review_cubit.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/view_models/add_to_cart/add_to_cart_cubit.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/view_models/add_to_favorite/add_to_favorite_cubit.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/view_models/advertising_deatils_cubit/advertising_details_cubit.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/view_models/check_proudct/check_product_cubit.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/view_models/delete_from_favorite_cubit/delete_from_favorite_cubit.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/add_review_view.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/home_client_view.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/notification_reviews_delivered_view.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/notification_view.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/product_details_view.dart';
import 'package:ecommerce_app/features/client_features/home/presentaion/views/store_seller_view.dart';
import 'package:ecommerce_app/features/client_features/profile/data/repos/profile_client_repo_impl.dart';
import 'package:ecommerce_app/features/client_features/profile/presentation/view_models/edit_profile_cubit/edit_profile_cubit.dart';
import 'package:ecommerce_app/features/client_features/profile/presentation/view_models/get_orders_cubit/get_orders_cubit.dart';
import 'package:ecommerce_app/features/client_features/profile/presentation/views/edit_profile_view.dart';
import 'package:ecommerce_app/features/client_features/profile/presentation/views/order_client_view.dart';
import 'package:ecommerce_app/features/client_features/review/data/repos/review_repo_impl.dart';
import 'package:ecommerce_app/features/client_features/review/presentaion/view_models/review_product_cubit/review_product_cubit.dart';
import 'package:ecommerce_app/features/client_features/review/presentaion/views/product_reviews_view.dart';
import 'package:ecommerce_app/features/client_features/search/data/models/result_model.dart';
import 'package:ecommerce_app/features/client_features/search/data/repos/search_repo_impl.dart';
import 'package:ecommerce_app/features/client_features/search/presentaion/view_models/search_product_cubit/search_product_cubit.dart';
import 'package:ecommerce_app/features/client_features/search/presentaion/views/result_product_view.dart';
import 'package:ecommerce_app/features/client_features/search/presentaion/views/search_product_view.dart';
import 'package:ecommerce_app/features/introduction_screen/presentation/views/introduction_screen_view.dart';
import 'package:ecommerce_app/features/seller_features/add/data/repos/add_features_repo_impl.dart';
import 'package:ecommerce_app/features/seller_features/add/presentaion/view_models/add_advertising_cubit/add_advertising_cubit.dart';
import 'package:ecommerce_app/features/seller_features/add/presentaion/view_models/add_coupon_cubit/add_coupon_cubit.dart';
import 'package:ecommerce_app/features/seller_features/add/presentaion/view_models/get_product_seller_cubit/get_product_seller_cubit.dart';
import 'package:ecommerce_app/features/seller_features/add/presentaion/views/add_advertising_view.dart';
import 'package:ecommerce_app/features/seller_features/add/presentaion/views/add_coupon_view.dart';
import 'package:ecommerce_app/features/seller_features/add/presentaion/views/seller_add_features_view.dart';
import 'package:ecommerce_app/features/seller_features/home/presentation/views/home_seller_view.dart';
import 'package:ecommerce_app/features/seller_features/orders/data/repos/order_seller_repo_impl.dart';
import 'package:ecommerce_app/features/seller_features/orders/presentation/view_models/seller_order_cubit/seller_order_cubit.dart';
import 'package:ecommerce_app/features/seller_features/orders/presentation/views/seller_order_details_view.dart';
import 'package:ecommerce_app/features/seller_features/orders/presentation/views/seller_orders_view.dart';
import 'package:ecommerce_app/features/seller_features/product/data/repos/product_repo_impl.dart';
import 'package:ecommerce_app/features/seller_features/product/presentaion/view_models/add_product_cubit/add_product_cubit.dart';
import 'package:ecommerce_app/features/seller_features/product/presentaion/view_models/all_category_cubit/all_categories_cubit.dart';
import 'package:ecommerce_app/features/seller_features/product/presentaion/view_models/category_product_cubit/category_product_cubit.dart';
import 'package:ecommerce_app/features/seller_features/product/presentaion/view_models/edit_product_cubit/edit_product_cubit.dart';
import 'package:ecommerce_app/features/seller_features/product/presentaion/views/add_product_view.dart';
import 'package:ecommerce_app/features/seller_features/product/presentaion/views/edit_product_view.dart';
import 'package:ecommerce_app/features/seller_features/product/presentaion/views/seller_product_view.dart';
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
          builder: (context, state) {
            final product = state.extra as ProductModel;
            return BlocProvider(
              create: (context) => ReviewProductCubit(
                  getIt.get<ReviewRepoImpl>(), product.id as int)
                ..getFavoriteProducts(),
              child: ProductReviewsView(productModel: product),
            );
          }),
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
        path: CheckoutView.path,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            // BlocProvider<CreateAddressCubit>(
            //   create: (context) =>
            //       CreateAddressCubit(getIt.get<CartRepoImpl>()),
            // ),

            BlocProvider.value(
                value: QuantityCartItemCubit(getIt.get<CartRepoImpl>())),
            BlocProvider<CouponCartCubit>(
              create: (context) => CouponCartCubit(getIt.get<CartRepoImpl>()),
            ),
            BlocProvider<CreateOrderCubit>(
              create: (context) => CreateOrderCubit(getIt.get<CartRepoImpl>()),
            ),
          ],
          child: CheckoutView(products: state.extra as List<ProductModel>),
        ),
      ),
      GoRoute(
        path: SearchProductView.path,
        builder: (context, state) => BlocProvider<SearchProductCubit>(
          create: (context) => SearchProductCubit(getIt.get<SearchRepoImpl>()),
          child: const SearchProductView(),
        ),
      ),
      GoRoute(
        path: AddressView.path,
        builder: (context, state) => const AddressView(),
      ),
      GoRoute(
        path: EditProfileView.path,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            // BlocProvider.value(
            //   value: UserInformationCubit(getIt.get<ProfileClientRepoImpl>())
            //     ..getInformationUser(),
            // ),
            BlocProvider(
              create: (context) =>
                  EditProfileCubit(getIt.get<ProfileClientRepoImpl>()),
            ),
          ],
          child: const EditProfileView(),
        ),
      ),
      GoRoute(
        path: OrderClientView.path,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider<GetOrdersCubit>(
              create: (context) =>
                  GetOrdersCubit(getIt.get<ProfileClientRepoImpl>())
                    ..getOrders(0),
            ),
          ],
          child: const OrderClientView(),
        ),
      ),
      GoRoute(
          path: StoreSellerView.path,
          builder: (context, state) {
            AdvertisingModel advertisingModel = state.extra as AdvertisingModel;
            return BlocProvider(
              create: (context) =>
                  AdvertisingDetailsCubit(getIt.get<HomeClientRepoImpl>())
                    ..getAdsToday(advertisingModel.id!),
              child: const StoreSellerView(),
            );
          }),
      GoRoute(
        path: NotificationView.path,
        builder: (context, state) => const NotificationView(),
      ),
      GoRoute(
        path: AddReviewView.path,
        builder: (context, state) => BlocProvider(
          create: (context) => AddReviewCubit(getIt.get<HomeClientRepoImpl>()),
          child: AddReviewView(
              notificationModel: state.extra as NotificationModel),
        ),
      ),
      GoRoute(
        path: NotificationReviewDeliveredView.path,
        builder: (context, state) => const NotificationReviewDeliveredView(),
      ),
      GoRoute(
        path: SellerProductView.path,
        builder: (context, state) => const SellerProductView(),
      ),
      GoRoute(
        path: EditProductView.path,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  CategoryProductCubit(getIt.get<ProductRepoImpl>()),
            ),
            BlocProvider(
              create: (context) =>
                  EditProductCubit(getIt.get<ProductRepoImpl>()),
            ),
            BlocProvider(
              create: (context) =>
                  AddProductCubit(getIt.get<ProductRepoImpl>()),
            ),
            BlocProvider(
              create: (context) =>
                  AllCategoriesCubit(getIt.get<ProductRepoImpl>())
                    ..getAllCategories(),
            ),
          ],
          child: EditProductView(product: state.extra as ProductModel),
        ),
      ),
      GoRoute(
          path: AddProductView.path,
          builder: (context, state) => MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (context) =>
                        AddProductCubit(getIt.get<ProductRepoImpl>()),

                    // AllCategoriesCubit
                  ),
                  BlocProvider(
                    create: (context) =>
                        AllCategoriesCubit(getIt.get<ProductRepoImpl>())
                          ..getAllCategories(),

                    //
                  ),
                ],
                child: const AddProductView(),
              )),
      GoRoute(
        path: SellerAddFeaturesView.path,
        builder: (context, state) => const SellerAddFeaturesView(),
      ),
      GoRoute(
          path: AddCouponView.path,
          builder: (context, state) => MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (context) =>
                        GetProductSellerCubit(getIt.get<AddFeaturesRepoImpl>())
                          ..getProductsSeller(),
                  ),
                  BlocProvider(
                      create: (context) =>
                          AddCouponCubit(getIt.get<AddFeaturesRepoImpl>())),
                ],
                child: const AddCouponView(),
              )),
      GoRoute(
        path: AddAdvertisingView.path,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              AddAdvertisingCubit(getIt.get<AddFeaturesRepoImpl>()),
          child: const AddAdvertisingView(),
        ),
      ),
      GoRoute(
        path: SellerOrderDetailsView.path,
        builder: (context, state) => const SellerOrderDetailsView(),
      ),
      GoRoute(
        path: SellerOrderView.path,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              SellerOrderCubit(getIt.get<OrderSellerRepoImpl>())
                ..getSellerOrders(0),
          child: const SellerOrderView(),
        ),
      ),
    ],
  );
}

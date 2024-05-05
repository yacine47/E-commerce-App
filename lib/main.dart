// import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/utils/app_router.dart';
import 'package:ecommerce_app/core/utils/my_assets.dart';
// import 'package:ecommerce_app/core/utils/dio_interceptor.dart';
import 'package:ecommerce_app/core/utils/my_colors.dart';
import 'package:ecommerce_app/core/utils/service_locator.dart';
import 'package:ecommerce_app/features/client_features/cart/data/repos/cart_repo_impl.dart';
import 'package:ecommerce_app/features/client_features/cart/presentaion/view_models/create_address_cubit/create_address_cubit.dart';
import 'package:ecommerce_app/features/client_features/favorite/data/repos/favorite_repo_impl.dart';
import 'package:ecommerce_app/features/client_features/favorite/presentaion/view_models/favorite_product/favorite_product_cubit.dart';
import 'package:ecommerce_app/features/client_features/profile/data/repos/profile_client_repo_impl.dart';
import 'package:ecommerce_app/features/client_features/profile/presentation/view_models/user_information_cubit/user_information_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  setup();
  await Hive.initFlutter();
  await Hive.openBox('settings');
  // DioInterceptor(getIt.get<Dio>());
  runApp(const EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FavoriteProductCubit>(
          create: (context) =>
              FavoriteProductCubit(getIt.get<FavoriteRepoImpl>())
                ..getFavoriteProducts(),
        ),
        BlocProvider<CreateAddressCubit>(
            create: (context) => CreateAddressCubit(getIt.get<CartRepoImpl>())),
        BlocProvider(
          create: (context) =>
              UserInformationCubit(getIt.get<ProfileClientRepoImpl>()),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
        theme: ThemeData(
          // fontFamily: MyAssets.fontFamilyGilroy,
          fontFamily: MyAssets.fontFamilyUrbanist,
          // textTheme: GoogleFonts.urbanistTextTheme(Theme.of(context).textTheme),
          scaffoldBackgroundColor: Colors.white,
          colorScheme: ColorScheme.fromSeed(seedColor: MyColors.primaryColor),
        ),
      ),
    );
  }
}

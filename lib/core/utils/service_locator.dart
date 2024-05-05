import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/utils/api_service.dart';
import 'package:ecommerce_app/features/authentication/data/models/user_model.dart';
import 'package:ecommerce_app/features/authentication/data/repos/auth_repo_impl.dart';
import 'package:ecommerce_app/features/client_features/cart/data/repos/cart_repo_impl.dart';
import 'package:ecommerce_app/features/client_features/favorite/data/repos/favorite_repo_impl.dart';
import 'package:ecommerce_app/features/client_features/home/data/repos/home_client_repo_impl.dart';
import 'package:ecommerce_app/features/client_features/profile/data/repos/profile_client_repo_impl.dart';
import 'package:ecommerce_app/features/client_features/review/data/repos/review_repo_impl.dart';
import 'package:ecommerce_app/features/client_features/search/data/repos/search_repo_impl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<ApiService>(ApiService(getIt.get<Dio>()));
  getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl(getIt.get<ApiService>()));
  getIt.registerSingleton<FavoriteRepoImpl>(
      FavoriteRepoImpl(getIt.get<ApiService>()));

  getIt.registerSingleton<ReviewRepoImpl>(
      ReviewRepoImpl(getIt.get<ApiService>()));

  getIt.registerSingleton<SearchRepoImpl>(
      SearchRepoImpl(getIt.get<ApiService>()));

  getIt.registerSingleton<CartRepoImpl>(CartRepoImpl(getIt.get<ApiService>()));
  getIt.registerSingleton<ProfileClientRepoImpl>(ProfileClientRepoImpl(getIt.get<ApiService>()));
  getIt.registerSingleton<HomeClientRepoImpl>(
      HomeClientRepoImpl(getIt.get<ApiService>()));
  getIt.registerSingleton<UserModel>(UserModel());

// // Alternatively you could write it if you don't like global variables
//   GetIt.I.registerSingleton<AppModel>(AppModel());
}

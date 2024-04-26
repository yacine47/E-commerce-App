

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/core/models/product_model.dart';
import 'package:ecommerce_app/core/utils/api_service.dart';
import 'package:ecommerce_app/features/client_features/favorite/data/repos/favorite_repo.dart';

class FavoriteRepoImpl extends FavoriteRepo {
  final ApiService apiService ;

  FavoriteRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<ProductModel>>> getFavoriteProducts() async {
    try {
      List<dynamic> data = await apiService.get('products/favorite');
      List<ProductModel> products = [];
      List<dynamic> productsData = data[0]['favorites'];

      for (int i = 0; i < productsData.length; i++) {
        products.add(ProductModel.fromJson(productsData[i]));
      }

      return right(products);
    } catch (e) {
      if (e is DioException) {
        return left(ServiceFailure.fromDioError(e));
      }
      return left(ServiceFailure(e.toString()));
    }
  }
}
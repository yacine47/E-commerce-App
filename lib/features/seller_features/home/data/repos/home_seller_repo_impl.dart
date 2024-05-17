import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/core/models/product_model.dart';
import 'package:ecommerce_app/core/utils/api_service.dart';
import 'package:ecommerce_app/features/seller_features/home/data/repos/hmoe_seller_repo.dart';

class HomeSellerRepoImpl extends HomeSellerRepo {
  final ApiService apiService;

  HomeSellerRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<ProductModel>>> getProductOfSeller() async {
    try {
      List<dynamic> data = await apiService.get('products/seller');
      List<ProductModel> products = [];
      for (var element in data) {
        products.add(ProductModel.fromJson(element));
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

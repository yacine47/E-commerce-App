import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/core/utils/api_service.dart';
import 'package:ecommerce_app/features/seller_features/product/data/repos/product_repo.dart';

class ProductRepoImpl extends ProductRepo {
  ProductRepoImpl(this.apiService);

  final ApiService apiService;

  @override
  Future<Either<Failure, String>> addNewProduct(

      Map<String, dynamic> dataRequest) async {
    try {
      var data = await apiService.post('products/seller/add/', dataRequest);
      
      return right(data['response']);
    } catch (e) {
      if (e is DioException) {
        return left(ServiceFailure.fromDioError(e));
      }
      return left(ServiceFailure(e.toString()));
    }
  }
}

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/core/models/product_model.dart';
import 'package:ecommerce_app/core/utils/api_service.dart';
import 'package:ecommerce_app/features/client_features/search/data/repos/search_repo.dart';

class SearchRepoImpl extends SearchRepo {
  final ApiService apiService;

  SearchRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<ProductModel>>> searchProduct(String search) async{
     try {
      List<dynamic> data = await apiService.get('products/search?search=$search');
      List<ProductModel> products = [];

      for (int i = 0; i < data.length; i++) {
        products.add(ProductModel.fromJson(data[i]));
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

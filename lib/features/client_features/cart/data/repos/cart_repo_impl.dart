import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/core/models/product_model.dart';
import 'package:ecommerce_app/core/utils/api_service.dart';
import 'package:ecommerce_app/features/client_features/cart/data/repos/cart_repo.dart';

class CartRepoImpl extends CartRepo {
  final ApiService apiService;

  CartRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<ProductModel>>> getProductCart() async {
    try {
      List<dynamic> data = await apiService.get('cart');
      List<ProductModel> products = [];
      List<dynamic> productsData = data[0]['products'];

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

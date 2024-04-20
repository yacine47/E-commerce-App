import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/core/utils/api_service.dart';
import 'package:ecommerce_app/features/client_features/home/data/models/category_model.dart';
import 'package:ecommerce_app/features/client_features/home/data/repos/home_client_repo.dart';

class HomeClientRepoImpl extends HomeClientRepo {
  final ApiService apiService;

  HomeClientRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<CategoryModel>>> getAllCategories() async {
    try {
      List<dynamic> data = await apiService.get('categories');
      List<CategoryModel> categories = [];

      for (int i = 0; i < data.length; i++) {
        categories.add(CategoryModel.fromJson(data[i]));
      }

      return right(categories);
    } catch (e) {
      if (e is DioException) {
        return left(ServiceFailure.fromDioError(e));
      }
      return left(ServiceFailure(e.toString()));
    }
  }
}

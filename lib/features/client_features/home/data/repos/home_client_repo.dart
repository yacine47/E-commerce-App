import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/features/client_features/home/data/models/category_model.dart';
import 'package:ecommerce_app/features/client_features/home/data/models/product_model.dart';

abstract class HomeClientRepo {
  Future<Either<Failure, List<CategoryModel>>> getAllCategories();
  // Future<Either<Failure, List<ProductModel>>> getAllProducts();
  Future<Either<Failure, List<ProductModel>>> getProductByCategory(
      int idCategory);
}

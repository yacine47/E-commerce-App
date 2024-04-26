import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/core/models/product_model.dart';

abstract class FavoriteRepo {
      Future<Either<Failure, List<ProductModel>>> getFavoriteProducts();

}
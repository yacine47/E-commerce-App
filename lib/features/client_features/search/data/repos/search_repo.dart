

import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/core/models/product_model.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<ProductModel>>> searchProduct(String search); 
}
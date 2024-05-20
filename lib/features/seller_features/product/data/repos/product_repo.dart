import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

abstract class ProductRepo {
  Future<Either<Failure, String>> addNewProduct(
      Map<String, dynamic> dataRequest,
      List<File> images,
      List<int> categoriesProduct);

  Future<Either<Failure, String>> editProduct({
    required int idProduct,
    required Map<String, dynamic> dataRequest,
    required List<dynamic> images,
    required List<int> categoriesProduct,
  });

  Future<Either<Failure, List<MultiSelectItem<int>>>> getAllCategories();

  Future<Either<Failure, List<int>>> getCategoryProduct(int idProduct);

  Future<Either<Failure, String>> deleteProduct(int idProduct);
}



import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failures.dart';

abstract class ProductRepo {


  Future<Either<Failure, String>> addNewProduct(
      Map<String, dynamic> dataRequest,List<File> images);
}
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

abstract class AddFeaturesRepo {
  Future<Either<Failure, String>> addAdvertising(File? imagePath);

  Future<Either<Failure, String>> addCoupon( Map<String,dynamic> dataRequest,List<int> productIds,);

  
  Future<Either<Failure, List<MultiSelectItem<int>>>> getProductsSeller() ;
  // images/seller
}

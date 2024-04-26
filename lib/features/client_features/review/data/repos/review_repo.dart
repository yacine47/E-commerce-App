

import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/features/client_features/review/data/models/review_model.dart';

abstract class ReviewRepo {
      Future<Either<Failure, List<ReviewModel>>> getReviewsProduct(int idProduct);
}
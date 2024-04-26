import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/core/utils/api_service.dart';
import 'package:ecommerce_app/features/client_features/review/data/models/review_model.dart';
import 'package:ecommerce_app/features/client_features/review/data/repos/review_repo.dart';

class ReviewRepoImpl extends ReviewRepo {
  final ApiService apiService;

  ReviewRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<ReviewModel>>> getReviewsProduct(int idProduct) async {
    try {
      List<dynamic> data = await apiService.get('reviews/$idProduct');
      List<ReviewModel> reviews = [];
      List<dynamic> reviewsData = data[0]['reviews'];

      for (int i = 0; i < reviewsData.length; i++) {
        reviews.add(ReviewModel.fromJson(reviewsData[i]));
      }

      return right(reviews);
    } catch (e) {
      if (e is DioException) {
        return left(ServiceFailure.fromDioError(e));
      }
      return left(ServiceFailure(e.toString()));
    }
  }
}

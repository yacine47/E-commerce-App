import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/features/client_features/home/data/models/advertising_model.dart';
import 'package:ecommerce_app/features/client_features/home/data/models/category_model.dart';
import 'package:ecommerce_app/core/models/product_model.dart';
import 'package:ecommerce_app/features/client_features/home/data/models/notification_model.dart';

abstract class HomeClientRepo {
  Future<Either<Failure, List<CategoryModel>>> getAllCategories();
  // Future<Either<Failure, List<ProductModel>>> getAllProducts();
  Future<Either<Failure, List<ProductModel>>> getProductByCategory(
      int idCategory);

  Future<Either<Failure, bool>> checkProductInFavorite(int idProduct);

  Future<Either<Failure, String>> addProductToFavorite(int idProduct);

  Future<Either<Failure, String>> addProductToCart(int idProduct);

  Future<Either<Failure, String>> deleteProductFromFavorite(int idProduct);

  Future<Either<Failure, String>> createReportProduct(
      int idProduct, Map<String, dynamic> data);

      Future<Either<Failure, String>> createReviewProduct(
       Map<String, dynamic> dataReview, Map<String, dynamic> dataNotification);

  Future<Either<Failure, List<AdvertisingModel>>> getAdsToday();
  Future<Either<Failure, AdvertisingModel>> getAdsDetails(int id);

  Future<Either<Failure, List<NotificationModel>>> getAllOrderItemDelivred();

  Future<Either<Failure, int>> getAllOrderItemDelivredCount();
}

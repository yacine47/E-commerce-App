import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/core/models/category_model.dart';
import 'package:ecommerce_app/core/utils/api_service.dart';
import 'package:ecommerce_app/features/client_features/home/data/models/advertising_model.dart';
import 'package:ecommerce_app/core/models/product_model.dart';
import 'package:ecommerce_app/features/client_features/home/data/models/notification_model.dart';
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

  @override
  Future<Either<Failure, AdvertisingModel>> getAdsDetails(int id) async {
    try {
      Map<String, dynamic> data = await apiService.get('ads/$id');

      return right(AdvertisingModel.fromJson(data));
    } catch (e) {
      if (e is DioException) {
        return left(ServiceFailure.fromDioError(e));
      }
      return left(ServiceFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<AdvertisingModel>>> getAdsToday() async {
    try {
      List<dynamic> data = await apiService.get('ads');
      List<AdvertisingModel> advertisings = [];

      for (int i = 0; i < data.length; i++) {
        advertisings.add(AdvertisingModel.fromJson(data[i]));
      }

      return right(advertisings);
    } catch (e) {
      if (e is DioException) {
        return left(ServiceFailure.fromDioError(e));
      }
      return left(ServiceFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<NotificationModel>>>
      getAllOrderItemDelivred() async {
    try {
      List<dynamic> data = await apiService.get('reviews/notifications/all');
      List<NotificationModel> notifications = [];

      for (int i = 0; i < data.length; i++) {
        notifications.add(NotificationModel.fromJson(data[i]));
      }

      return right(notifications);
    } catch (e) {
      if (e is DioException) {
        return left(ServiceFailure.fromDioError(e));
      }
      return left(ServiceFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductModel>>> getProductByCategory(
      int idCategory) async {
    try {
      List<dynamic> data =
          await apiService.get('products/category/$idCategory');
      List<ProductModel> products = [];
      for (var element in data) {
        products.add(ProductModel.fromJson(element));
      }

      return right(products);
    } catch (e) {
      if (e is DioException) {
        return left(ServiceFailure.fromDioError(e));
      }
      return left(ServiceFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> checkProductInFavorite(int idProduct) async {
    try {
      Map<String, dynamic> data =
          await apiService.get('favorite/check_product/$idProduct');

      return right(data['response']);
    } catch (e) {
      if (e is DioException) {
        return left(ServiceFailure.fromDioError(e));
      }
      return left(ServiceFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> addProductToFavorite(int idProduct) async {
    try {
      Map<String, dynamic> data =
          await apiService.post('favorite/product/add/$idProduct', {});

      return right(data['message']);
    } catch (e) {
      if (e is DioException) {
        return left(ServiceFailure.fromDioError(e));
      }
      return left(ServiceFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> addProductToCart(int idProduct) async {
    try {
      Map<String, dynamic> data = await apiService.post('cart/add', {
        'id': idProduct,
      });

      return right(data['message']);
    } catch (e) {
      if (e is DioException) {
        return left(ServiceFailure.fromDioError(e));
      }
      return left(ServiceFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> deleteProductFromFavorite(
      int idProduct) async {
    try {
      Map<String, dynamic> data =
          await apiService.delete('favorite/product/destroy/$idProduct', {});

      return right(data['message']);
    } catch (e) {
      if (e is DioException) {
        return left(ServiceFailure.fromDioError(e));
      }
      return left(ServiceFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> createReportProduct(
      int idProduct, Map<String, dynamic> data) async {
    try {
      Map<String, dynamic> dataResponse = await apiService.post(
        'reports/report_product/add/$idProduct',
        data,
      );

      return right(dataResponse['message']);
    } catch (e) {
      if (e is DioException) {
        return left(ServiceFailure.fromDioError(e));
      }
      return left(ServiceFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> getAllOrderItemDelivredCount() async {
    try {
      Map<String, dynamic> dataResponse =
          await apiService.get('notifications/count');

      return right(dataResponse['response']);
    } catch (e) {
      if (e is DioException) {
        return left(ServiceFailure.fromDioError(e));
      }
      return left(ServiceFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> createReviewProduct(
      Map<String, dynamic> dataReview,
      Map<String, dynamic> dataNotification) async {
    try {
      Map<String, dynamic> dataResponse = await apiService.post(
        'reviews/add/',
        dataReview,
      );
      await apiService.put('notifications/review/update', dataNotification);

      return right(dataResponse['message']);
    } catch (e) {
      if (e is DioException) {
        return left(ServiceFailure.fromDioError(e));
      }
      return left(ServiceFailure(e.toString()));
    }
  }
}

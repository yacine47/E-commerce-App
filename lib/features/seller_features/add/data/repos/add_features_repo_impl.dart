import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/core/functions/upload_image.dart';
import 'package:ecommerce_app/core/models/product_model.dart';
import 'package:ecommerce_app/core/utils/api_service.dart';
import 'package:ecommerce_app/features/seller_features/add/data/models/coupon_model.dart';
import 'package:ecommerce_app/features/seller_features/add/data/repos/add_features_repo.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

class AddFeaturesRepoImpl extends AddFeaturesRepo {
  final ApiService apiService;

  AddFeaturesRepoImpl(this.apiService);

  @override
  Future<Either<Failure, String>> addAdvertising(
    File? imagePath,
  ) async {
    try {
      // await apiService.post('products/seller/add/', {});

      // uploadImageProduct
      await uploadImage(
        imagePath: imagePath,
        apiService: apiService,
        endPoint: 'images/advertising/add',
        fieldName: 'ads',
      );

      return right('The Ads added successfully');
    } catch (e) {
      if (e is DioException) {
        return left(ServiceFailure.fromDioError(e));
      }
      return left(ServiceFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> addCoupon(
    Map<String, dynamic> dataRequest,
    List<int> productIds,
  ) async {
    try {
      var data = await apiService.post('coupon/add', dataRequest);

      CouponModel coupon = CouponModel.fromJson(data['response']);

      // uploadImageProduct

      for (int i = 0; i < productIds.length; i++) {
        await apiService.post(
          'coupon/add_to_product',
          {
            'product_id': productIds[i],
            'coupon_id': coupon.id,
          },
        );
      }

      return right('The Coupon added successfully');
    } catch (e) {
      if (e is DioException) {
        return left(ServiceFailure.fromDioError(e));
      }
      return left(ServiceFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MultiSelectItem<int>>>>
      getProductsSeller() async {
    try {
      List<dynamic> data = await apiService.get('products/seller/choice');
      // List<CategoryModel> categories = [];
      List<MultiSelectItem<int>> multiSelectCategories = [];

      // ,
      for (int i = 1; i < data.length; i++) {
        // categories.add(CategoryModel.fromJson(data[i]));
        multiSelectCategories.add(MultiSelectItem<int>(
          ProductModel.fromJson(data[i]).id!,
          ProductModel.fromJson(data[i]).name!,
        ));
      }

      return right(multiSelectCategories);
    } catch (e) {
      if (e is DioException) {
        return left(ServiceFailure.fromDioError(e));
      }
      return left(ServiceFailure(e.toString()));
    }
  }
}

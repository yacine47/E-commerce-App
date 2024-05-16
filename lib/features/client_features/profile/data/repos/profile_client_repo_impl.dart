import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/core/utils/api_service.dart';
import 'package:ecommerce_app/features/authentication/data/models/user_model.dart';
import 'package:ecommerce_app/features/client_features/profile/data/models/order_model.dart';
import 'package:ecommerce_app/features/client_features/profile/data/repos/profile_client_repo.dart';
import 'package:hive/hive.dart';

class ProfileClientRepoImpl extends ProfileClientRepo {
  final ApiService apiService;

  ProfileClientRepoImpl(this.apiService);

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await apiService.post(
        'logout',
        {},
      );

      await Hive.box('settings').put('token', null);
      await Hive.box('settings').put('role', null);

      return right(null);
    } catch (e) {
      if (e is DioException) {
        return left(ServiceFailure.fromDioError(e));
      }
      return left(ServiceFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel>> getInformationUser() async {
    try {
      Map<String, dynamic> data = await apiService.get(
        'user_profile',
      );

      UserModel userModel = UserModel.fromJson(data);

      return right(userModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServiceFailure.fromDioError(e));
      }
      return left(ServiceFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> editProfile(
      File? imagePath, UserModel userModel) async {
    try {
      String? data = await uploadImageProfile(imagePath);

      await apiService.post(
        'user/edit',
        {
          'first_name': userModel.firstName,
          'last_name': userModel.lastName,
          'photo_profile': data ?? userModel.photoProfile
        },
      );
      return right(null);
    } catch (e) {
      if (e is DioException) {
        return left(ServiceFailure.fromDioError(e));
      }
      return left(ServiceFailure(e.toString()));
    }
  }

  Future<String?> uploadImageProfile(File? imagePath) async {
    Map<String, dynamic>? data;
    if (imagePath?.path != null) {
      FormData formData = FormData.fromMap({
        "profile": await MultipartFile.fromFile(imagePath!.path,
            filename: imagePath.path.split('/').last),
      });
      data = await apiService.post(
        'store_profile',
        formData,
      );
    }
    return data?['image'];
  }

  @override
  Future<Either<Failure, List<OrderModel>>> getOrders(int index) async {
    try {
      List<dynamic> data = await apiService.get('orders/$index');
      List<OrderModel> orders = [];

      for (int i = 0; i < data.length; i++) {
        orders.add(OrderModel.fromJson(data[i]));
      }

      return right(orders);
    } catch (e) {
      if (e is DioException) {
        return left(ServiceFailure.fromDioError(e));
      }
      return left(ServiceFailure(e.toString()));
    }
  }
}

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/core/utils/api_service.dart';
import 'package:ecommerce_app/features/authentication/data/models/token_model.dart';
import 'package:ecommerce_app/features/authentication/data/models/user_model.dart';
import 'package:ecommerce_app/features/authentication/data/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiService apiService;

  AuthRepoImpl(this.apiService);
  @override
  Future<Either<Failure, TokenModel>> login(Map<String, dynamic> data) async {
    try {
      Map<String, dynamic> dataResponse =
          await apiService.post('auth/login', data);
      return right(TokenModel.fromJson(dataResponse));
    } catch (e) {
      if (e is DioException) {
        return left(ServiceFailure.fromDioError(e));
      }
      return left(ServiceFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel>> register(Map<String, dynamic> data) async {
    try {
      Map<String, dynamic> dataResponse =
          await apiService.post('auth/register', data);

      return right(UserModel.fromJson(dataResponse['user']));
    } catch (e) {
      if (e is DioException) {
        return left(ServiceFailure.fromDioError(e));
      }

      return left(ServiceFailure(e.toString()));
    }
  }
}


// iyac2077@gmail.com 
// rafinz629
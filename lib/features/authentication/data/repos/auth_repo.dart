import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/features/authentication/data/models/token_model.dart';
import 'package:ecommerce_app/features/authentication/data/models/user_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserModel>> register(Map<String, dynamic> data);
  Future<Either<Failure, TokenModel>> login(Map<String, dynamic> data);
}

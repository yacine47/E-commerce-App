import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/features/authentication/data/models/user_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserModel>> register();
  Future<Either<Failure, UserModel>> login();
}

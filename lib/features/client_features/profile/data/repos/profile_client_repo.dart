import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/features/authentication/data/models/user_model.dart';
import 'package:ecommerce_app/features/client_features/profile/data/models/order_model.dart';

abstract class ProfileClientRepo {
  Future<Either<Failure, void>> logout();
  Future<Either<Failure, UserModel>> getInformationUser();
  Future<Either<Failure, void>> editProfile(
      File? imagePath, UserModel userModel);

      Future<Either<Failure, List<OrderModel>>> getOrders();
}

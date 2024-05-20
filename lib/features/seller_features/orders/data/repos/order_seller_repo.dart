


import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/features/client_features/profile/data/models/order_model.dart';

abstract class OrderSellerRepo{
Future<Either<Failure, List<OrderModel>>> getSellerOrders(int index);

Future<Either<Failure, String>> updateOrder(int id);
}
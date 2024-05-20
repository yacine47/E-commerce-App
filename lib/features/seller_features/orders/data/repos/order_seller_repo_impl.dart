// orders/seller

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/core/utils/api_service.dart';
import 'package:ecommerce_app/features/client_features/profile/data/models/order_model.dart';
import 'package:ecommerce_app/features/seller_features/orders/data/repos/order_seller_repo.dart';

class OrderSellerRepoImpl extends OrderSellerRepo {
  final ApiService apiService;

  OrderSellerRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<OrderModel>>> getSellerOrders(int index) async {
    try {
      List<dynamic> data = await apiService.get('orders/seller/$index');
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

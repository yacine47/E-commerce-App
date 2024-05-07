part of 'get_orders_cubit.dart';

@immutable
abstract class GetOrdersState {}

class GetOrdersInitial extends GetOrdersState {}

class GetOrdersLoading extends GetOrdersState {}

class GetOrdersSuccess extends GetOrdersState {
  final List<OrderModel> orders;

  GetOrdersSuccess(this.orders);
}

class GetOrdersFailure extends GetOrdersState {
  final String errMessage;

  GetOrdersFailure(this.errMessage);
}

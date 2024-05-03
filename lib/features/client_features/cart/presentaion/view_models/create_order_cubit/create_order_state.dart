part of 'create_order_cubit.dart';

@immutable
abstract class CreateOrderState {}

class CreateOrderInitial extends CreateOrderState {}

class CreateOrderLoading extends CreateOrderState {}

class CreateOrderFailure extends CreateOrderState {
  final String errMessage;

  CreateOrderFailure(this.errMessage);
}

class CreateOrderSuccess extends CreateOrderState {
  final String succcessMessage;

  CreateOrderSuccess(this.succcessMessage);
}

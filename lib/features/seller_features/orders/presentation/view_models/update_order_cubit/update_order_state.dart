part of 'update_order_cubit.dart';

@immutable
abstract class UpdateOrderState {}

class UpdateOrderInitial extends UpdateOrderState {}

class UpdateOrderLoading extends UpdateOrderState {}

class UpdateOrderSuccess extends UpdateOrderState {
  final String successMessage;

  UpdateOrderSuccess(this.successMessage);
}

class UpdateOrderFailure extends UpdateOrderState {
  final String errMessage;

  UpdateOrderFailure(this.errMessage);
}

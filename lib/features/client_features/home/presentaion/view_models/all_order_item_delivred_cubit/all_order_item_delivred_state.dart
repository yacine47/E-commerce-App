part of 'all_order_item_delivred_cubit.dart';

@immutable
abstract class AllOrderItemDelivredState {}

class AllOrderItemDelivredInitial extends AllOrderItemDelivredState {}

class AllOrderItemDelivredLoading extends AllOrderItemDelivredState {}

class AllOrderItemDelivredSuccess extends AllOrderItemDelivredState {
  final List<NotificationModel> orderItems;

  AllOrderItemDelivredSuccess(this.orderItems);
}

class AllOrderItemDelivredFailure extends AllOrderItemDelivredState {
  final String errMessage;

  AllOrderItemDelivredFailure(this.errMessage);
}

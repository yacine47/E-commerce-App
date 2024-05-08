part of 'all_order_item_delivred_count_cubit.dart';

@immutable
abstract class AllOrderItemDelivredCountState {}

class AllOrderItemDelivredCountInitial extends AllOrderItemDelivredCountState {}

class AllOrderItemDelivredCountLoading extends AllOrderItemDelivredCountState {}

class AllOrderItemDelivredCountSuccess extends AllOrderItemDelivredCountState {
  final int count;

  AllOrderItemDelivredCountSuccess(this.count);
}

class AllOrderItemDelivredCountFailure extends AllOrderItemDelivredCountState {
  final String errMessage;

  AllOrderItemDelivredCountFailure(this.errMessage);
}

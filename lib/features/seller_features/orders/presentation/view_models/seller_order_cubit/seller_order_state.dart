part of 'seller_order_cubit.dart';

@immutable
abstract class SellerOrderState {}

class SellerOrderInitial extends SellerOrderState {}

class SellerOrderLoading extends SellerOrderState {}

class SellerOrderSuccess extends SellerOrderState {
  final List<OrderModel> orders;

  SellerOrderSuccess(this.orders);
}

class SellerOrderFailure extends SellerOrderState {
  final String errMessage;

  SellerOrderFailure(this.errMessage);
}

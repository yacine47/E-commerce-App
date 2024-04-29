part of 'quantity_cart_item_cubit.dart';

@immutable
abstract class QuantityCartItemState {}

class QuantityCartItemInitial extends QuantityCartItemState {}

class QuantityCartItemLoading extends QuantityCartItemState {}

class QuantityCartItemSuccess extends QuantityCartItemState {
  final String errMessage;

  QuantityCartItemSuccess(this.errMessage);
}

class QuantityCartItemFailure extends QuantityCartItemState {
  final String successMessage;

  QuantityCartItemFailure(this.successMessage);
}

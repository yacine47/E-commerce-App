part of 'add_to_cart_cubit.dart';

@immutable
abstract class AddToCartState {}

class AddToCartInitial extends AddToCartState {}

class AddToCartLoading extends AddToCartState {}

class AddToCartSuccess extends AddToCartState {
  final String successMessage;

  AddToCartSuccess(this.successMessage);
}

class AddToCartFailure extends AddToCartState {
  final String errMessage;

  AddToCartFailure(this.errMessage);
}

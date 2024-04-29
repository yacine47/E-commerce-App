part of 'delete_from_cart_cubit.dart';

@immutable
abstract class DeleteFromCartState {}

class DeleteFromCartInitial extends DeleteFromCartState {}

class DeleteFromCartLoading extends DeleteFromCartState {}

class DeleteFromCartSuccess extends DeleteFromCartState {
  final String successMessage;

  DeleteFromCartSuccess(this.successMessage);
}

class DeleteFromCartFailure extends DeleteFromCartState {
  final String errMessage;

  DeleteFromCartFailure(this.errMessage);
}

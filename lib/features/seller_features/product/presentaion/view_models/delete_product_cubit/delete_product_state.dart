part of 'delete_product_cubit.dart';

@immutable
abstract class DeleteProductState {}

class DeleteProductInitial extends DeleteProductState {}

class DeleteProductLoading extends DeleteProductState {}

class DeleteProductSuccess extends DeleteProductState {
  final String successMessage;

  DeleteProductSuccess(this.successMessage);
}

class DeleteProductFailure extends DeleteProductState {
  final String errMessage;

  DeleteProductFailure(this.errMessage);
}

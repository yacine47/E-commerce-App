part of 'add_product_cubit.dart';

@immutable
abstract class AddProductState {}

class AddProductInitial extends AddProductState {}

class AddProductLoading extends AddProductState {}

class AddProductSuccess extends AddProductState {
  final String successMessage;

  AddProductSuccess(this.successMessage);
}

class AddProductFailure extends AddProductState {
  final String errMessage;

  AddProductFailure(this.errMessage);
}

class AddProductImagesEmpty extends AddProductState {
  final String errMessage;

  AddProductImagesEmpty(this.errMessage);
}

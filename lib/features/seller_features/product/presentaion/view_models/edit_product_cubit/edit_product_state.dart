part of 'edit_product_cubit.dart';

@immutable
abstract class EditProductState {}

class EditProductInitial extends EditProductState {}

class EditProductLoading extends EditProductState {}

class EditProductSuccess extends EditProductState {
  final String successMessage;

  EditProductSuccess(this.successMessage);
}

class EditProductFailure extends EditProductState {
  final String errMessage;

  EditProductFailure(this.errMessage);
}
class EditProductImagesEmpty extends EditProductState {
  final String errMessage;

  EditProductImagesEmpty(this.errMessage);
}
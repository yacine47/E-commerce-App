part of 'category_product_cubit.dart';

@immutable
abstract class CategoryProductState {}

class CategoryProductInitial extends CategoryProductState {}

class CategoryProductLoading extends CategoryProductState {}

class CategoryProductSuccess extends CategoryProductState {
  final List<int> initValues;

  CategoryProductSuccess(this.initValues);
}

class CategoryProductFailure extends CategoryProductState {
  final String errMessage;

  CategoryProductFailure(this.errMessage);
}

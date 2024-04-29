part of 'product_by_category_cubit.dart';

@immutable
abstract class ProductByCategoryState {}

class ProductByCategoryInitial extends ProductByCategoryState {}

class ProductByCategorySuccess extends ProductByCategoryState {
  final List<ProductModel> products;

  ProductByCategorySuccess(this.products);
}

class ProductByCategoryFailure extends ProductByCategoryState {
  final String errMessage;

  ProductByCategoryFailure(this.errMessage);
}

class ProductByCategoryLoading extends ProductByCategoryState {}

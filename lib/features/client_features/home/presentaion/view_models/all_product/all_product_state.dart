part of 'all_product_cubit.dart';

@immutable
abstract class AllProductState {}

class AllProductInitial extends AllProductState {}

class AllProductLoading extends AllProductState {}

class AllProductSuccess extends AllProductState {
  final List<ProductModel> products;

  AllProductSuccess(this.products);
}

class AllProductFailure extends AllProductState {
  final String errMessage;

  AllProductFailure(this.errMessage);
}

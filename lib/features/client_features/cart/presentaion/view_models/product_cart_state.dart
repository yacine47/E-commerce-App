part of 'product_cart_cubit.dart';

@immutable
abstract class ProductCartState {}

class ProductCartInitial extends ProductCartState {}

class ProductCartLoading extends ProductCartState {}

class ProductCartSuccess extends ProductCartState {
  final List<ProductModel> products;

  ProductCartSuccess(this.products);
}

class ProductCartFailure extends ProductCartState {
  final String errMessage;

  ProductCartFailure(this.errMessage);
}

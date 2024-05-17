part of 'product_seller_cubit.dart';

@immutable
abstract class ProductSellerState {}

class ProductSellerInitial extends ProductSellerState {}

class ProductSellerLoading extends ProductSellerState {}

class ProductSellerSuccess extends ProductSellerState {
  final List<ProductModel> products;

  ProductSellerSuccess(this.products);
}

class ProductSellerFailure extends ProductSellerState {
  final String errMessage;

  ProductSellerFailure(this.errMessage);
}

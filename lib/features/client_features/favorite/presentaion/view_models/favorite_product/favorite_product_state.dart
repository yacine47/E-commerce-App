part of 'favorite_product_cubit.dart';

@immutable
abstract class FavoriteProductState {}

class FavoriteProductInitial extends FavoriteProductState {}

class FavoriteProductLoading extends FavoriteProductState {}

class FavoriteProductSuccess extends FavoriteProductState {
  final List<ProductModel> products;

  FavoriteProductSuccess(this.products);
}

class FavoriteProductFailure extends FavoriteProductState {
  final String errMessage;

  FavoriteProductFailure(this.errMessage);
}

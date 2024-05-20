part of 'get_product_seller_cubit.dart';

@immutable
abstract class GetProductSellerState {}

class GetProductSellerInitial extends GetProductSellerState {}

class GetProductSellerLoading extends GetProductSellerState {}

class GetProductSellerSuccess extends GetProductSellerState {
  final List<MultiSelectItem<int>> multiSelectProduct;

  GetProductSellerSuccess(this.multiSelectProduct);
}

class GetProductSellerFailure extends GetProductSellerState {
  final String errMessage;

  GetProductSellerFailure(this.errMessage);
}

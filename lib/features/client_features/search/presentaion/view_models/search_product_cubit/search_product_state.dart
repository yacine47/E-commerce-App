part of 'search_product_cubit.dart';

@immutable
abstract class SearchProductState {}

class SearchProductInitial extends SearchProductState {}

class SearchProductLoading extends SearchProductState {}

class SearchProductFailure extends SearchProductState {
  final String errMessage;

  SearchProductFailure(this.errMessage);
}

class SearchProductSuccess extends SearchProductState {
  final List<ProductModel> products;

  SearchProductSuccess(this.products);
}

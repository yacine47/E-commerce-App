import 'package:ecommerce_app/core/models/product_model.dart';

class ResultModel {
  final List<ProductModel> products;
  final String search;

  ResultModel({required this.products, required this.search});
}

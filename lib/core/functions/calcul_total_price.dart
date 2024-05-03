import 'package:ecommerce_app/core/models/product_model.dart';

int calculTotalPrice(context, List<ProductModel> products) {
  int sum = 0;
  for (var element in products) {
    sum += element.price! * element.quantityCartItem!;
  }

  return sum;
}

import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/models/product_model.dart';
import 'package:meta/meta.dart';

part 'product_cart_state.dart';

class ProductCartCubit extends Cubit<ProductCartState> {
  ProductCartCubit() : super(ProductCartInitial());
}

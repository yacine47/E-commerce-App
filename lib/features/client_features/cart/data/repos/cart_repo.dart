import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/core/models/product_model.dart';

abstract class CartRepo {
  Future<Either<Failure, List<ProductModel>>> getProductCart();

  Future<Either<Failure, String>> deleteProductFromCart(int idProduct);


  Future<Either<Failure, String>> updateQuantityCartItem(int idProduct,int counter);
  
}

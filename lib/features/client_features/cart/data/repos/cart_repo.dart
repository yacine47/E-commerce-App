import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/core/models/product_model.dart';
import 'package:ecommerce_app/features/client_features/cart/data/models/address_model.dart';
import 'package:ecommerce_app/features/client_features/cart/data/models/coupon_cart_model.dart';

abstract class CartRepo {
  Future<Either<Failure, List<ProductModel>>> getProductCart();

  Future<Either<Failure, String>> deleteProductFromCart(int idProduct);

  Future<Either<Failure, String>> updateQuantityCartItem(
      int idProduct, int counter);

  Future<Either<Failure, CouponCartModel>> couponCart(String coupon);

  Future<Either<Failure, AddressModel>> createNewAddress(
      Map<String, dynamic> dataFromModel);

  Future<Either<Failure, String>> createNewOrder(
      Map<String, dynamic> dataRequest);
}

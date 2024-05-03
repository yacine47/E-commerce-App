import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/core/models/product_model.dart';
import 'package:ecommerce_app/core/utils/api_service.dart';
import 'package:ecommerce_app/features/client_features/cart/data/models/address_model.dart';
import 'package:ecommerce_app/features/client_features/cart/data/models/coupon_cart_model.dart';
import 'package:ecommerce_app/features/client_features/cart/data/models/order_model.dart';
import 'package:ecommerce_app/features/client_features/cart/data/repos/cart_repo.dart';

class CartRepoImpl extends CartRepo {
  final ApiService apiService;

  CartRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<ProductModel>>> getProductCart() async {
    try {
      List<dynamic> data = await apiService.get('cart');
      List<ProductModel> products = [];
      List<dynamic> productsData = data[0]['products'];

      for (int i = 0; i < productsData.length; i++) {
        products.add(ProductModel.fromJson(productsData[i]));
      }

      return right(products);
    } catch (e) {
      if (e is DioException) {
        return left(ServiceFailure.fromDioError(e));
      }
      return left(ServiceFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> deleteProductFromCart(int idProduct) async {
    try {
      Map<String, dynamic> data =
          await apiService.delete('cart/destroy/$idProduct', {});

      return right(data['message']);
    } catch (e) {
      if (e is DioException) {
        return left(ServiceFailure.fromDioError(e));
      }
      return left(ServiceFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> updateQuantityCartItem(
      int idProduct, int counter) async {
    try {
      Map<String, dynamic> data = await apiService.put(
        'cart/update/$idProduct',
        {
          'quantity_cart_item': counter,
        },
      );

      return right(data['message']);
    } catch (e) {
      if (e is DioException) {
        return left(ServiceFailure.fromDioError(e));
      }
      return left(ServiceFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CouponCartModel>> couponCart(String coupon) async {
    try {
      var data = await apiService.get('cart/coupon?coupon=$coupon');
      print(data);
      return right(CouponCartModel.fromJson(data['response']));
    } catch (e) {
      print(e.toString());
      if (e is DioException) {
        return left(ServiceFailure.fromDioError(e));
      }
      return left(ServiceFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AddressModel>> createNewAddress(
      Map<String, dynamic> dataFromModel) async {
    try {
      var data = await apiService.post('order/address/add/', dataFromModel);
      print(data);
      return right(AddressModel.fromJson(data['response']));
    } catch (e) {
      print(e.toString());
      if (e is DioException) {
        return left(ServiceFailure.fromDioError(e));
      }
      return left(ServiceFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> createNewOrder(
      Map<String, dynamic> dataRequest) async {
    try {
      var dataOrder = await apiService.post('order/add/', dataRequest);
      OrderModel order = OrderModel.fromJson(dataOrder['response']);
      var data = await apiService.post('order/order_items/add/', {
        'order_id': order.id,
      });
      print(data);
      return right(data['response']);
    } catch (e) {
      print(e.toString());
      if (e is DioException) {
        return left(ServiceFailure.fromDioError(e));
      }
      return left(ServiceFailure(e.toString()));
    }
  }
}

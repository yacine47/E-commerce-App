import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/core/models/product_model.dart';
import 'package:ecommerce_app/core/utils/api_service.dart';
import 'package:ecommerce_app/features/seller_features/product/data/repos/product_repo.dart';

class ProductRepoImpl extends ProductRepo {
  ProductRepoImpl(this.apiService);

  final ApiService apiService;

  @override
  Future<Either<Failure, String>> addNewProduct(
      Map<String, dynamic> dataRequest, List<File> images) async {
    try {
      var data = await apiService.post('products/seller/add/', dataRequest);

      ProductModel productModel = ProductModel.fromJson(data['response']);

      for (int i = 0; i < images.length; i++) {
        uploadImageProduct(images[i], productModel.id!);
      }

      return right('The Product Added successflly');
    } catch (e) {
      if (e is DioException) {
        return left(ServiceFailure.fromDioError(e));
      }
      return left(ServiceFailure(e.toString()));
    }
  }

  Future<String?> uploadImageProduct(File? imagePath, int idProduct) async {
    Map<String, dynamic>? data;
    if (imagePath?.path != null) {
      FormData formData = FormData.fromMap({
        "image": await MultipartFile.fromFile(imagePath!.path,
            filename: imagePath.path.split('/').last),
      });
      data = await apiService.post(
        'store_product_image/$idProduct',
        formData,
      );
    }
    return data?['image'];
  }
}

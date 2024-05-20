import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/core/models/category_model.dart';
import 'package:ecommerce_app/core/models/image_model.dart';
import 'package:ecommerce_app/core/models/product_model.dart';
import 'package:ecommerce_app/core/utils/api_service.dart';
import 'package:ecommerce_app/features/seller_features/product/data/models/category_product_model.dart';
import 'package:ecommerce_app/features/seller_features/product/data/repos/product_repo.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

class ProductRepoImpl extends ProductRepo {
  ProductRepoImpl(this.apiService);

  final ApiService apiService;
//

  @override
  Future<Either<Failure, String>> deleteProduct(int idProduct) async {
    try {
      Map<String, dynamic> data =
          await apiService.delete('products/seller/delete/$idProduct', {});

      return right(data['message']);
    } catch (e) {
      if (e is DioException) {
        return left(ServiceFailure.fromDioError(e));
      }
      return left(ServiceFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> addNewProduct(
    Map<String, dynamic> dataRequest,
    List<File> images,
    List<int> categoriesProduct,
  ) async {
    try {
      var data = await apiService.post('products/seller/add/', dataRequest);

      ProductModel productModel = ProductModel.fromJson(data['response']);

      for (int i = 0; i < images.length; i++) {
        await uploadImageProduct(images[i], productModel.id!);
      }

      await addCategoryToProduct(categoriesProduct, productModel.id!);

      return right('The Product Added successflly');
    } catch (e) {
      if (e is DioException) {
        return left(ServiceFailure.fromDioError(e));
      }
      return left(ServiceFailure(e.toString()));
    }
  }

  Future<void> addCategoryToProduct(
      List<int> categoriesProduct, int idProduct) async {
    for (int i = 0; i < categoriesProduct.length; i++) {
      await apiService.post(
        'categories/add',
        {
          'product_id': idProduct,
          'category_id': categoriesProduct[i],
        },
      );
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

  @override
  Future<Either<Failure, List<MultiSelectItem<int>>>> getAllCategories() async {
    try {
      List<dynamic> data = await apiService.get('categories');
      // List<CategoryModel> categories = [];
      List<MultiSelectItem<int>> multiSelectCategories = [];

      // ,
      for (int i = 1; i < data.length; i++) {
        // categories.add(CategoryModel.fromJson(data[i]));
        multiSelectCategories.add(MultiSelectItem<int>(
            CategoryModel.fromJson(data[i]).id,
            CategoryModel.fromJson(data[i]).name));
      }

      return right(multiSelectCategories);
    } catch (e) {
      if (e is DioException) {
        return left(ServiceFailure.fromDioError(e));
      }
      return left(ServiceFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<int>>> getCategoryProduct(int idProduct) async {
    try {
      List<dynamic> data = await apiService
          .get('categories/product/$idProduct'); //categories/product/{id}
      // List<CategoryModel> categories = [];
      List<int> initValues = [];

      // ,
      for (int i = 0; i < data.length; i++) {
        // categories.add(CategoryModel.fromJson(data[i]));
        initValues.add(CategoryProductModel.fromJson(data[i]).categoryId!);
      }

      return right(initValues);
    } catch (e) {
      if (e is DioException) {
        return left(ServiceFailure.fromDioError(e));
      }
      return left(ServiceFailure(e.toString()));
    }
  }


  @override
  Future<Either<Failure, String>> editProduct({
    required int idProduct,
    required Map<String, dynamic> dataRequest,
    required List<dynamic> images,
    required List<int> categoriesProduct,
  }) async {
    try {
      await apiService.put('products/seller/update/$idProduct', dataRequest);

      // ProductModel productModel = ProductModel.fromJson(data['response']);

      List<dynamic> imagesDeleted =
          await deleteAllImagesExist(idProduct);

      // for (int i = 0; i < dataImages.length; i++) {}

      for (int i = 0; i < images.length; i++) {
        if (images[i] is File) {
          await uploadImageProduct(images[i], idProduct);
        } else if (images[i] is ImageModel) {
          if (imagesDeleted.any((element) => images[i].id == element['id'])) {
            await apiService.post('images/add_exist_image', {
              'path': images[i].path,
              'product_id': idProduct,
            });
          }
        }
      }

      await apiService.delete('categories/product/delete/$idProduct', {});

      await addCategoryToProduct(categoriesProduct, idProduct);

      return right('The Product Updated successflly');
    } catch (e) {
      if (e is DioException) {
        return left(ServiceFailure.fromDioError(e));
      }
      return left(ServiceFailure(e.toString()));
    }
  }

  Future<List< dynamic>> deleteAllImagesExist(
    int idProduct,
  ) async {
    var dataImages = await apiService.delete('images/delete/$idProduct', {});

    List<dynamic> imagesDeleted =
        dataImages['images'];
    return imagesDeleted;
  }
}

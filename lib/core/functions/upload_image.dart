

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/utils/api_service.dart';

Future<String?> uploadImage({required File? imagePath,required String endPoint,required ApiService apiService,required String fieldName}) async {
    Map<String, dynamic>? data;
    if (imagePath?.path != null) {
      FormData formData = FormData.fromMap({
        fieldName: await MultipartFile.fromFile(imagePath!.path,
            filename: imagePath.path.split('/').last),
      });
      data = await apiService.post(
        endPoint,
        formData,
      );
    }
    return data?['image'];
  }
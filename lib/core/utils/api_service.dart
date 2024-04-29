import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class ApiService {
  final String baseUrl = 'http://10.0.2.2:8000/api/';
  final Dio _dio;

  ApiService(this._dio);

  Future<dynamic> get(String endPoint) async {
    String? token = Hive.box('settings').get('token');
    if (token == null || JwtDecoder.isExpired(token)) {
      Response response = await _dio.get('$baseUrl$endPoint');
      return response.data;
    }

    Response response = await _dio.get('$baseUrl$endPoint',
        options: Options(headers: {'authorization': 'Bearer $token'}));

    return response.data;
  }

  Future<Map<String, dynamic>> post(String endPoint, Object data) async {
    String? token = Hive.box('settings').get('token');
    if (token == null || JwtDecoder.isExpired(token)) {
      Response response = await _dio.post('$baseUrl$endPoint', data: data);

      return response.data;
    }

    Response response = await _dio.post('$baseUrl$endPoint',
        data: data,
        options: Options(
          headers: {'authorization': 'Bearer $token'},
        ));
    return response.data;
  }

  Future<Map<String, dynamic>> put(String endPoint, Object data) async {
    String? token = Hive.box('settings').get('token');
    if (token == null || JwtDecoder.isExpired(token)) {
      Response response = await _dio.put('$baseUrl$endPoint', data: data);

      return response.data;
    }

    Response response = await _dio.put('$baseUrl$endPoint',
        data: data,
        options: Options(
          headers: {'authorization': 'Bearer $token'},
        ));
    return response.data;
  }


  Future<Map<String, dynamic>> delete(String endPoint, Object data) async {
    String? token = Hive.box('settings').get('token');
    if (token == null || JwtDecoder.isExpired(token)) {
      Response response = await _dio.delete('$baseUrl$endPoint', data: data);

      return response.data;
    }

    Response response = await _dio.delete('$baseUrl$endPoint',
        data: data,
        options: Options(
          headers: {'authorization': 'Bearer $token'},
        ));
    return response.data;
  }

  Future<String> refreshToken(String token) async {
    Map<String, dynamic> dataResponse = await post('auth/refresh', {
      'token': token,
    });

    return dataResponse['access_token'];
  }
}


// 192.168.2. 
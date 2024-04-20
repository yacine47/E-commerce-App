import 'package:dio/dio.dart';

class ApiService {
  final String baseUrl = 'http://10.0.2.2:8000/api/';
  final Dio _dio;

  ApiService(this._dio);

  Future<dynamic> get(String endPoint) async {
    Response response = await _dio.get('$baseUrl$endPoint');
    return response.data;
  }

  Future<Map<String, dynamic>> post(String endPoint, Object data) async {
    Response response = await _dio.post(
      '$baseUrl$endPoint',
      data: data,
    );

    return response.data;
  }
}


// 192.168.2.101
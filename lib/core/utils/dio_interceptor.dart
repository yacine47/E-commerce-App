import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/utils/api_service.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DioInterceptor {
  final Dio _dio;

  DioInterceptor(this._dio) {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          String? accessToken = Hive.box('settings').get('token');
          if (accessToken != null || accessToken!.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $accessToken';
          }

          // else if (accessToken == null) {
          //   options.cancelToken;
          // }
          return handler.next(options);
        },
        onError: (DioException e, handler) async {
          if (e.requestOptions.headers['Authorization'] == null) {
            // await handleUnauthenticatedRequest(context);
          } else if (e.response?.statusCode == 401) {
            String newAccessToken = await ApiService(_dio)
                .refreshToken(Hive.box('srttings').get('token'));
            e.requestOptions.headers['Authorization'] =
                'Bearer $newAccessToken';
            return handler.resolve(await _dio.fetch(e.requestOptions));
          }
          return handler.next(e);
        },
      ),
    );
  }
}

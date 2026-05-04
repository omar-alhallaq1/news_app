import 'package:dio/dio.dart';
import 'package:news_app/core/networking/api_endpoints.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioHelper {
  static Dio? dio;
  static void initDio() {
    dio ??= Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,

        receiveTimeout: const Duration(seconds: 20),
        receiveDataWhenStatusError: true,
      ),
    );
    dio!.interceptors.add(
      PrettyDioLogger(),
    ); //"وظيفتها الأساسية هي تسهيل عملية تصحيح الأخطاء (Debugging) من خلال عرض تفاصيل طلبات الـ API بشكل منظم وجميل في الـ Console."
  }

  static Future<dynamic> getrequest({
    required String endpoint,
    Map<String, dynamic>? query,
  }) async {
    try {
      final response = await dio!.get(endpoint, queryParameters: query);
      return response.data;
    } on DioException catch (e) {
      throw e.message ?? "An error occurred";
    }
  }

  static Future<dynamic> postrequest({
    required String endpoint,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
  }) async {
    try {
      final response = await dio!.post(
        endpoint,
        queryParameters: query,
        data: data,
      );
      return response.data;
    } on DioException catch (e) {
      throw e.message ?? "An error occurred";
    }
  }
}

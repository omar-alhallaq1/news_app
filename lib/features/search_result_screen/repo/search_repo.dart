import 'dart:developer';

import 'package:news_app/core/constans/constans.dart';
import 'package:news_app/core/networking/api_endpoints.dart';
import 'package:news_app/core/networking/dio_helper.dart';
import 'package:news_app/features/home_screen/modles/top_headlines_modle.dart';

class SearchResultScreenServices {
  Future<ArticalModles?> searchitembyname(String query) async {
    try {
      final response = await DioHelper.getrequest(
        endpoint: ApiEndpoints.searchendpoint,
        query: {
          "apiKey": AppConstants.apiKey,
          "q": query,
          "language": AppConstants.lang,
        },
      );

      // التعديل هنا: فحص الـ status داخل الـ Map مباشرة
      if (response != null && response['status'] == 'ok') {
        final topHeadLinesModle = ArticalModles.fromJson(response);
        log(topHeadLinesModle.totalResults.toString());
        return topHeadLinesModle;
      }
    } catch (e) {
      log(
        "Error in Services: ${e.toString()}",
      ); // تسجيل الخطأ للمساعدة في التصحيح
      return Future.error(e.toString());
    }

    return null;
  }
}

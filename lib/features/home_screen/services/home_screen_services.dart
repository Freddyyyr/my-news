import 'dart:developer';

import 'package:news_app/core/constants/constants.dart';
import 'package:news_app/core/networking/api_endpoints.dart';
import 'package:news_app/core/networking/dio_helper.dart';
import 'package:news_app/features/home_screen/models/top_headlines_model.dart';

class HomeScreenServices {
  getTopHeadlineArticle() async {
    try {
      final response = await DioHelper.getRequest(
        endPoint: ApiEndpoints.topHeadlinesEndpoint,
        query: {"apiKey": AppConstants.newsApiKey, "country": "us"},
      );
      if (response.statusCode == 200) {
        TopHeadlinesModel topHeadlinesModel = TopHeadlinesModel.fromJson(
          response.data,
        );
        log(topHeadlinesModel.totalResults.toString());
        return topHeadlinesModel;
      }
    } catch (e) {
      log(e.toString());
      return Future.error(e.toString());
    }
  }
}

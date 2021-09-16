import 'dart:convert';

import 'package:test/constants/app_constants.dart';
import 'package:test/models/news_model.dart';

import 'package:http/http.dart' as http;

class ApiServices {
  Future<NewsModel> getNews() async {
    dynamic newsModel;
    final response = await http.get(
      Uri.parse(AppConstants.api_url),
    );
    if (response.statusCode == 200) {
      final jsonMap = jsonDecode(response.body);

      newsModel = NewsModel.fromJson(jsonMap);
      return newsModel;
    } else {
      throw Exception("Error occured");
    }
  }
}

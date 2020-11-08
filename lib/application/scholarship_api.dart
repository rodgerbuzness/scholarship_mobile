import 'package:dio/dio.dart';
import 'package:scholarship/base_url.dart';

class ScholarshipApi {
  static BaseOptions _baseOPtions = new BaseOptions(baseUrl: BASE_URL);

// for unauthenticated apis
  static Dio dio = new Dio(_baseOPtions);

// Authenticated routes
  static Dio dioAuth() {
    return Dio();
  }
}

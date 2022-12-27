import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../modules/tenor/tenor_models/tenor_model.dart';
import '../../constant/api_url.dart';

class TenorApi {
  Future<Tenor?> fetchTrendingTenor([int? limit]) async {
    Tenor? tenor;
    try {
      Response tenorData = await Dio()
          .get('$trendingApiURL&Pos=0&limit=${limit??10}');
      tenor = Tenor.fromJson(tenorData.data);
    } on DioError catch (e) {
      if (e.response != null) {
        if (kDebugMode) {
          print('Dio error!');
          print('STATUS: ${e.response?.statusCode}');
          print('DATA: ${e.response?.data}');
          print('HEADERS: ${e.response?.headers}');
        }
      } else {
        if (kDebugMode) {
          print('Error sending request!');
          print(e.message);
        }
      }
    }
    return tenor;

  }

  Future<Tenor?> searchTenorsGif(String searchText, [int? limit]) async {
    Tenor? tenor;
    try {
      Response tenorData = await Dio()
          .get('$searchApiURL$searchText&pos=0&limit=${limit??''}');
      tenor = Tenor.fromJson(tenorData.data);
    } on DioError catch (e) {
      if (e.response != null) {
        if (kDebugMode) {
          print('Dio error!');
          print('STATUS: ${e.response?.statusCode}');
          print('DATA: ${e.response?.data}');
          print('HEADERS: ${e.response?.headers}');
        }
      } else {
        if (kDebugMode) {
          print('Error sending request!');
          print(e.message);
        }
      }
    }
    return tenor;
  }
}

import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';
import '../config/serviceUrl.dart';

// 首页主题内容
Future getHomePageContent(formData) async {
  try {
    print('qing');
    Response response;
    Dio dio = new Dio();
    print(servicePath);
    response = await dio.get(servicePath, queryParameters: formData);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('接口异常');
    }
  } catch (err) {
    print(err);
  }
}

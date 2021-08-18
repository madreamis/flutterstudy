// import 'dart:convert';

import 'package:dio/dio.dart';
import 'dart:async';
// import 'dart:io';
import '../config/serviceUrl.dart';
// import '../../model/fiveListf.dart';

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
      // return fivemodel;
    } else {
      throw Exception('接口异常');
    }
  } catch (err) {
    print(err);
  }
}

// 登录
Future getLogin(formData) async {
  try {
    // print('登录');
    Response response;
    Dio dio = new Dio();
    // print(loginUrl);
    response = await dio.get(loginUrl, queryParameters: formData);
    print('登录');
    print(response);
    if (response.statusCode == 200) {
      return response.data;
      // return fivemodel;
    } else {
      throw Exception('接口异常');
    }
  } catch (err) {
    print(err);
  }
}

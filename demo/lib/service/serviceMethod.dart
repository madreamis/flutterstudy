import 'dart:convert';

import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';
import '../config/serviceUrl.dart';
import '../../model/fiveListf.dart';

// 首页主题内容
Future getHomePageContent(formData) async {
  try {
    print('qing');
    Response response;
    Dio dio = new Dio();
    print(servicePath);
    response = await dio.get(servicePath, queryParameters: formData);
    if (response.statusCode == 200) {
      // Map<String, dynamic> jsonMap = json.decode(response.data);
      // Map<String, dynamic> jsonMap = response.cast<String, dynamic>();
      // print(jsonMap);
      // fiveModel fivemodel = fiveModel.fromJson(jsonMap);
      return response.data;
      // return fivemodel;
    } else {
      throw Exception('接口异常');
    }
  } catch (err) {
    print(err);
  }
}

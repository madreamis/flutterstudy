import 'dart:io';

import 'package:demo/config/serviceUrl.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioHttp {
  late Dio _client;
  late BuildContext context;

  static DioHttp of(BuildContext context) {
    return DioHttp._interbal(context);
  }

  DioHttp._interbal(BuildContext context) {
    // ignore: unnecessary_null_comparison
    if (_client == null || context != this.context) {
      this.context = context;
      var options = BaseOptions(
          baseUrl: Config.BaseUrl,
          connectTimeout: 1000 * 10,
          receiveTimeout: 1000 * 3,
          extra: {'context': context});
      var client = Dio(options);
      this._client = client;
    }
  }

  Future<Response<Map<String, dynamic>>> get(String path,
      [Map<String, dynamic>? params, String? token]) async {
    var options = Options(headers: {'Authorization': token});
    return await _client.get(path, queryParameters: params, options: options);
  }

  Future<Response<Map<String, dynamic>>> post(String path,
      [Map<String, dynamic>? params, String? token]) async {
    var options = Options(headers: {'Authorization': token});
    return await _client.post(path, data: params, options: options);
  }

  Future<Response<Map<String, dynamic>>> postFormData(String path,
      [Map<String, dynamic>? params, String? token]) async {
    var options = Options(
        contentType: 'multipart/form-data', headers: {'Authorization': token});
    return await _client.post(path, data: params, options: options);
  }
}

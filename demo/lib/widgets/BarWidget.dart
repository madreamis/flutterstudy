import 'package:flutter/material.dart';

AppBar getAppbar(String title) {
  return AppBar(
    title: Text(title),
    elevation: 10, //阴影
    centerTitle: true,
  );
}

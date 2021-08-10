import 'package:flutter/material.dart';

// ignore: camel_case_types
class searchPage extends StatefulWidget {
  const searchPage({Key? key, arguments}) : super(key: key);

  @override
  _searchPageState createState() => _searchPageState();
}

// ignore: camel_case_types
class _searchPageState extends State<searchPage> {
  // final arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("搜素"),
      ),
      body: Text("搜素"),
    );
  }
}

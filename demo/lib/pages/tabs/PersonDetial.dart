import 'package:flutter/material.dart';

class PersonDetial extends StatefulWidget {
  const PersonDetial({Key? key}) : super(key: key);

  @override
  _PersonDetialState createState() => _PersonDetialState();
}

class _PersonDetialState extends State<PersonDetial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("个人详情"),
      ),
    );
  }
}

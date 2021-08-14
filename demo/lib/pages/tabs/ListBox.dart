import 'package:flutter/material.dart';
import '../../service/serviceMethod.dart';

class ListBox extends StatefulWidget {
  const ListBox({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String name;
  @override
  _ListBoxState createState() => _ListBoxState();
}

class _ListBoxState extends State<ListBox> {
  var a;
  var type;
  @override
  // 请求实例
  void initState() {
    print(widget.name);
    this.type = widget.name;
    if (this.type == '全部') {
      this.type = 0;
    }
    if (this.type == '黑') {
      this.type = 1;
    }
    if (this.type == '白') {
      this.type = 2;
    }
    var formData = {
      "pageNum": 1,
      "pageSize": 10,
      "colorType": 0,
    };
    formData["colorType"] = this.type;
    getHomePageContent(formData).then((val) {
      setState(() {
        this.a = val.toString();
        print(a);
      });
    });
  }

  Widget build(BuildContext context) {
    return Container(
      child: Text(widget.name),
    );
  }
}

// model


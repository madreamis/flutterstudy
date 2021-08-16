import 'dart:convert';
import 'dart:io';

import 'package:demo/widgets/loading_container.dart';
import 'package:flutter/material.dart';
import '../../service/serviceMethod.dart';
import '../../model/fiveListf.dart';

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
  List listMay = [];
  // ignore: unused_field
  bool _loading = false;

  var data = [];
  @override
  // 请求实例
  // // 请求实例
  // void getList() async {
  //   try {
  //     Response response;
  //     response = await Dio().get(
  //         "http://124.70.33.245:8080/fiveColorRoster/getList",
  //         queryParameters: {"colorType": 0, "pageNum": 1, "pageSize": 10});
  //     print(response);
  //   } catch (err) {
  //     print(err);
  //   }
  // }
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
    print(formData);
    getHomePageContent(formData).then((val) {
      // ignore: unused_local_variable
      // print(val);
      // var data1 = json.decode(val['data'].toString());
      // print(val);
      // fiveModel list2 = fiveModel.fromJson(val['data']);
      // print(list2.list);
      // final dataList = val['data']['list'];
      // print(dataList);
      // List<Comment> artList = [];
      // for (var article in dataList) {
      //   artList.add(Comment.fromJson(article));
      // }
      // print(artList);
      // list2.list.forEach((item) => print(item.id));
      // final result = json.decode(val['data']);
      // print(result);
      // print(val['data']);
      // print(val);
      // // Map<String, dynamic> user = jsonDecode(val);
      // var b = fiveModel.fromJson(val);
      // print(b);
      setState(() {
        print(val);
        this.data.add(val['data']['list']);
        // listMay = list2.list;
        // list2.list.forEach((item) =>
        //     //  print(item.id),
        // listMay.add({
        //   "id": item.id.toString(),
        //   "userId": item.userId,
        //   "userName": item.userName,
        //   "colorType": item.colorType,
        //   "addTime": item.addTime,
        //   "updateTime": item.updateTime,
        //   "deleted": item.deleted,
        // }));
        // this.a = val;
        // listMay.add(list2.data);
        // print(a);
      });
      // print(this.data[0]['id']);
    });
  }

  Future _handleRefresh() async {
    print('shauixn');
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: LoadingContainer(
        isLoading: _loading,
        child: RefreshIndicator(
          onRefresh: _handleRefresh,
          child: MediaQuery.removePadding(
              context: context,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Container();
                },
                itemExtent: 50,
                itemCount: listMay.length,
              )),
        ),
      ),
    );
  }
}

// model


import 'dart:convert';
import 'dart:io';

// import 'package:demo/model/fiveList.dart';
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
  List<Comment> listMay = [];
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
      print(val);
      var useArr = new fiveModel.fromJson(val['data']); //转化为obj.取值的模型
      print(useArr);
      setState(() {
        listMay.addAll(useArr.list);
      });
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
                  return Container(
                    child: Text(
                      listMay[index].userName.toString(),
                    ),
                  );
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


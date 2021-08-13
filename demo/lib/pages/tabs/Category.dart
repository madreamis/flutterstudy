import 'dart:math';

import 'package:flutter/material.dart';
// 引入dio库
import 'package:dio/dio.dart';
// 封装请求
import '../../service/serviceMethod.dart';

class CatrgoryPage extends StatefulWidget {
  const CatrgoryPage({Key? key}) : super(key: key);

  @override
  _CatrgoryPageState createState() => _CatrgoryPageState();
}

class _CatrgoryPageState extends State<CatrgoryPage>
    with SingleTickerProviderStateMixin {
  // ignore: unused_field
  late TabController _tabController;
  var list = ["全部", "黑", "白"];
  var a;
  var b;
  @override
  void initState() {
    // 调用\
    var formData = {
      "pageNum": 1,
      "pageSize": 10,
      "colorType": 0,
    };
    getHomePageContent(formData).then((val) {
      setState(() {
        this.a = val.toString();
        print(a);
      });
    });
    super.initState();
    _tabController = new TabController(vsync: this, length: this.list.length);
    _tabController.addListener(() {
      // print(this._tabController.toString());
      if (_tabController.index == _tabController.animation!.value) {
        // 点击切换tab的时候执行了一个动画效果，滑动切换的时候是没有的，在这个过程中触发了一次Listener,所以触发了两次addListener方法,我们只需要addListener方法中加入一个判断_tabController.addListener(() {
        var formData = {
          "pageNum": 1,
          "pageSize": 10,
          "colorType": 0,
        };
        formData["colorType"] = _tabController.index;
        getHomePageContent(formData).then((value) {
          setState(() {
            this.b = value.toString();
            print(b);
          });
        });
        print(_tabController.index);
      }
    });
  }

// 退出销毁组件状态
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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

  Widget build(BuildContext context) {
    // getList();
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Row(
              // textDirection: TextDirection.rtl,
              // mainAxisAlignment: MainAxisAlignment.start,
              // mainAxisSize: MainAxisSize.max,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: TabBar(
                    // isScrollable: true, //开启滚动
                    // labelStyle: TextStyle(fontSize: 14),
                    // onTap: (context) {
                    //   print(this.context);
                    //   // print(CatrgoryPage);
                    // },
                    // controller: Container,
                    indicatorSize: TabBarIndicatorSize.label,
                    // indicator: const BoxDecoration(),//取消点击下划线效果
                    controller: _tabController,
                    tabs: this.list.map((e) {
                      return Tab(text: e);
                    }).toList(),
                    // tabs: [
                    //   Tab(
                    //     text: "全部",
                    //   ),
                    //   Tab(
                    //     text: "黑名单",
                    //   ),
                    //   Tab(
                    //     text: "红名单",
                    //   )
                    // ],
                  ),
                )
              ],
            ),
          ),
          body: TabBarView(
              controller: this._tabController,
              children: list.map((e) {
                return ListBox(
                  name: e,
                );
              }).toList()),
        ));
  }
}

// 无状态组件
// class ListBox extends StatelessWidget {
//   final name;
//   const ListBox(String e, {Key? key, required this.name}) : super(key: key);
//   // 接受传值

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Text(name),
//     );
//   }
// }
class ListBox extends StatefulWidget {
  final String name;
  const ListBox({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  _ListBoxState createState() => _ListBoxState();
}

class _ListBoxState extends State<ListBox> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

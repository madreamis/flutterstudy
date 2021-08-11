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
  @override
  void initState() {
    // 调用
    getHomePageContent().then((val) {
      setState(() {
        this.a = val.toString();
        print(a);
      });
    });
    super.initState();
    this._tabController =
        new TabController(vsync: this, length: this.list.length);
    this._tabController.addListener(() {
      // print(this._tabController.toString());
      // print(this._tabController.index);
      // print(this._tabController.length);
      print(list[this._tabController.index]);

      // print(this._tabController.previousIndex);
    });
  }

  // 请求实例
  void getList() async {
    try {
      Response response;
      response = await Dio().get(
          "http://124.70.33.245:8080/fiveColorRoster/getList",
          queryParameters: {"colorType": 0, "pageNum": 1, "pageSize": 10});
      print(response);
    } catch (err) {
      print(err);
    }
  }

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
                    controller: this._tabController,
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
            children: [
              ListView(
                children: [
                  ListTile(
                    title: Text("第一"),
                  )
                ],
              ),
              ListView(
                children: [
                  ListTile(
                    title: Text("第二"),
                  )
                ],
              ),
              ListView(
                children: [
                  ListTile(
                    title: Text("第二"),
                  )
                ],
              )
            ],
          ),
        ));
  }
}

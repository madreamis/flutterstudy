import 'package:flutter/material.dart';
import 'Category.dart';
import 'Home.dart';
import 'Person.dart';
import 'Setting.dart';

class Tabs extends StatefulWidget {
  const Tabs({Key? key}) : super(key: key);

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _currentIndex = 0; //局部变量一般使用下划线
  List _pageList = [
    Home(),
    CatrgoryPage(),
    SettingPage(),
    PersonPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //     // title: Text("flutter"),
      //     ),
      body: this._pageList[this._currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          // selectedItemColor: Colors.black,
          //被选择item的颜色
          // selectedItemColor: Colors.amber[800],
          fixedColor: Colors.pink,
          //未选择item的颜色
          unselectedItemColor: Colors.blue,
          // 索引
          //当前页
          currentIndex: this._currentIndex,
          iconSize: 25.0,
          type: BottomNavigationBarType.fixed,
          // 触发方法
          onTap: (int index) {
            print(index);
            setState(() {
              this._currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                // ignore: deprecated_member_use
                title: Text("首页")),
            // ignore: deprecated_member_use
            BottomNavigationBarItem(
                icon: Icon(Icons.category),
                // ignore: deprecated_member_use
                title: Text("分类")),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                // ignore: deprecated_member_use
                title: Text("设置")),
            // ignore: deprecated_member_use
            BottomNavigationBarItem(icon: Icon(Icons.person), title: Text("个人"))
          ]),
    );
  }
}

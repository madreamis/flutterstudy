import 'package:demo/pages/tabs/PersonDetial.dart';
import 'package:demo/utils/store.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersonPage extends StatefulWidget {
  const PersonPage({Key? key}) : super(key: key);

  @override
  _PersonPageState createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  var user;
  void initState() {
    super.initState();
    getApp();
  }

  void getApp() async {
    // ignore: unused_local_variable
    final SharedPreferences prefs = await _prefs;
    Store store = await Store.getInstance();
    setState(() {
      user = store.getString(username);
      print(user);
      user = prefs.getString('username');
      print(user);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("个人中心"),
      ),
      body: Column(
        children: [
          InkWell(
            onTap: () {
              print("详情");
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return PersonDetial();
              }));
            },
            child: Container(
              padding: EdgeInsets.all(5),
              color: Theme.of(context).backgroundColor,
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/images/4.jpg'),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: ListTile(
                      title: Text("$user"),
                      subtitle: Text("18022883245"),
                    ),
                  ),
                  Icon(Icons.keyboard_arrow_right)
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            color: Theme.of(context).canvasColor,
            child: ListTile(
              leading: Icon(Icons.account_circle),
              title: Text("个人信息"),
              trailing: Icon(Icons.keyboard_arrow_right),
            ),
          ),
          Container(
            color: Theme.of(context).canvasColor,
            child: ListTile(
              leading: Icon(Icons.lock),
              title: Text("修改密码"),
              trailing: Icon(Icons.keyboard_arrow_right),
            ),
          ),
          Container(
            color: Theme.of(context).canvasColor,
            child: ListTile(
              leading: Icon(Icons.star_border),
              title: Text("我的收藏"),
              trailing: Icon(Icons.keyboard_arrow_right),
            ),
          ),
          Container(
            color: Theme.of(context).canvasColor,
            child: ListTile(
              leading: Icon(Icons.near_me),
              title: Text("信息上报"),
              trailing: Icon(Icons.keyboard_arrow_right),
            ),
          ),
          Container(
            color: Theme.of(context).canvasColor,
            child: ListTile(
              leading: Icon(Icons.settings),
              title: Text("切换账号"),
              trailing: Icon(Icons.keyboard_arrow_right),
            ),
          ),
          Container(
            color: Theme.of(context).canvasColor,
            child: ListTile(
              leading: Icon(Icons.power_settings_new),
              title: Text("退出登录"),
              trailing: Icon(Icons.keyboard_arrow_right),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:demo/pages/tabs/PersonDetial.dart';
import 'package:flutter/material.dart';

class PersonPage extends StatefulWidget {
  const PersonPage({Key? key}) : super(key: key);

  @override
  _PersonPageState createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
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
              padding: EdgeInsets.all(16),
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
                      title: Text("用户昵称"),
                      subtitle: Text("签名"),
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
              leading: Icon(Icons.aspect_ratio),
              title: Text("我的订单1"),
              trailing: Icon(Icons.keyboard_arrow_right),
            ),
          ),
          Container(
            color: Theme.of(context).primaryColor,
            child: ListTile(
              leading: Icon(Icons.aspect_ratio),
              title: Text("我的订单2"),
              trailing: Icon(Icons.keyboard_arrow_right),
            ),
          ),
          Container(
            color: Theme.of(context).primaryColor,
            child: ListTile(
              leading: Icon(Icons.aspect_ratio),
              title: Text("我的订单3"),
              trailing: Icon(Icons.keyboard_arrow_right),
            ),
          ),
          Container(
            color: Theme.of(context).primaryColor,
            child: ListTile(
              leading: Icon(Icons.aspect_ratio),
              title: Text("我的订单4"),
              trailing: Icon(Icons.keyboard_arrow_right),
            ),
          )
        ],
      ),
    );
  }
}

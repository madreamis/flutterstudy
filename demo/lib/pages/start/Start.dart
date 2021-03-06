// 项目启动页的配置信息
import 'dart:async';
import 'package:demo/pages/login/Login.dart';
// import 'package:demo/pages/tabs/Tabs.dart';
import 'package:flutter/material.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  // ignore: unused_field
  late Timer _timer;
  int _currentTime = 6;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(milliseconds: 1000), (timer) {
      setState(() {
        _currentTime--;
      });
      if (_currentTime <= 0) {
        _jumpRootPage();
      }
    });
  }

// 跳转函数的配置
  void _jumpRootPage() {
    _timer.cancel();
    // 跳转并关闭当前页面，并且无法返回当前页面。
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return LoginPage();
    }), (route) => false);
  }

  Widget build(BuildContext context) {
    var name = 'assets/images/3.jpg';
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            name,
            fit: BoxFit.fill,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Positioned(
            child: InkWell(
              child: _clipButton(),
              onTap: _jumpRootPage,
            ),
            top: MediaQuery.of(context).padding.top + 10,
            right: 10,
          )
        ],
      ),
    );
  }

  Widget _clipButton() {
    return ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Container(
          width: 50,
          height: 50,
          color: Colors.black.withOpacity(0.5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '跳过',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
              Text(
                '${_currentTime}s',
                style: TextStyle(color: Colors.white, fontSize: 12),
              )
            ],
          ),
        ));
  }
}

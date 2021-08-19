// 登录首页的配置信息

import 'package:demo/pages/tabs/Tabs.dart';
import 'package:demo/service/serviceMethod.dart';
import 'package:demo/utils/store.dart';
import 'package:demo/widgets/BarWidget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/store.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var name = 'assets/images/4.jpg';
  // ignore: unused_field
  var _user = '';
  // ignore: unused_field
  var _password = '';
  var _scaffoldkey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  late String username;

  @override
  // ignore: override_on_non_overriding_member
  void login() async {
    final SharedPreferences prefs = await _prefs;
    Store store = await Store.getInstance();
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print('$_user,$_password');
      // 第一种方式

      // var formData = {
      //   "password": '',
      //   "phonenum": '',
      // };
      // formData['password'] = '222';
      // formData['phonenum'] = '13843854382';
      // formData['password'] = _password;
      // formData['phonenum'] = _user;
      // 第二种方式
      Map<String, dynamic> formData = {
        'password': '222',
        'phonenum': '13843854382'
      };
      print(formData);
      getLogin(formData).then((value) async => {
            // print(value);
            username = value['data']['userName'],
            print(username),
            if (value['flag'] == true)
              {
                // 登陆成功,存取字段在本地
                await store.setString(StoreKeys.token, username),
                // prefs.setString("username", username),
                print(store),
                Navigator.pushAndRemoveUntil(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return Tabs();
                }), (route) => false)
              }
            else
              {
                _scaffoldkey.currentState!.showSnackBar(SnackBar(
                  content: Text(value['message']),
                )),
                _formKey.currentState!.reset(), //重置输入框
              }
          });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldkey,
        appBar: getAppbar("登录"),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Image.asset(
                  name,
                  width: double.infinity,
                  height: 260,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  height: 16,
                ),
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "账号",
                            hintText: "请输入账号",
                            prefixIcon: Icon(Icons.person),
                          ),
                          // validator: (value) {
                          //   return value.toString().length >= 6 ? null : "不少于6";
                          // },
                          onSaved: (value) {
                            _user = value!;
                          },
                          autofocus: true,
                          textInputAction: TextInputAction.next,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "密码",
                            hintText: "请输入密码",
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: new IconButton(
                                icon: new Icon(
                                  Icons.remove_red_eye,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  print("密码");
                                }),
                          ),
                          autofocus: true,
                          textInputAction: TextInputAction.done,
                          // validator: (String? value) {
                          //   return value.toString().length >= 6 ? null : "不少于6";
                          // },
                          onSaved: (value) {
                            _password = value!;
                          },
                        ),
                      ],
                    )),
                SizedBox(
                  height: 16,
                ),
                GestureDetector(
                  child: Container(
                    child: Text(
                      "找回密码",
                      textAlign: TextAlign.right,
                      style: TextStyle(color: Colors.blue),
                    ),
                    width: double.infinity,
                  ),
                  onTap: () {
                    print("找回密码");
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  width: double.infinity,
                  // color: Colors.blue,
                  // ignore: deprecated_member_use
                  child: RaisedButton(
                    color: Colors.green,
                    textColor: Colors.white,
                    child: Text(
                      "登陆",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    onPressed: () {
                      login();
                    },
                  ),
                ),
                // TextButton(
                //   onPressed: () {
                //     print("登录");
                //   },
                //   child: Container(
                //     child: Text("登录"),
                //   ),
                // ),
              ],
            ),
          ),
        ));
  }
}

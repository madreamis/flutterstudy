import 'package:demo/utils/store.dart';
import 'package:flutter/cupertino.dart';
import 'package:scoped_model/scoped_model.dart';

class AuthModel extends Model {
  String _token = "";
  String get token => _token;

  bool get isLogin => _token is String && _token != '';

  void initApp(BuildContext context) async {
    Store store = await Store.getInstance();
    String token = store.getString(StoreKeys.token);
    if (!stringIsNullOrRmpty(token)) {
      login(token, context);
    }
  }

  void login(String token, BuildContext context) {
    _token = token;
    notifyListeners();
  }

  void logout() {
    _token = '';
    notifyListeners();
  }
}

// 方法：判断字符串是否为空值。

bool stringIsNullOrRmpty(String str) {
  // ignore: unnecessary_null_comparison
  if (str == '' || str == null) return true;
  return false;
}

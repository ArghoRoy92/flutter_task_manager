import 'dart:convert';

import 'package:flutter_task_manager/data/model/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthUtility {
  AuthUtility._();

  static Future<void> saveUserInfo(LoginModel model) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user-data', model.toJson().toString());
  }

  static Future<LoginModel> getUserInfo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String value = prefs.getString('user-data')!;
    return LoginModel.fromJson(jsonDecode(value));
  }

  static Future<void> clearUserInfo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  static Future<bool> ifUserInfoLoggedIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool islogin = prefs.containsKey('user-data');
    if (islogin) {
      await getUserInfo();
    }
    return islogin;
  }
}

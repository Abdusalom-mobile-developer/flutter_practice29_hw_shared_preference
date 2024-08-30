import 'dart:convert';

import 'package:flutter_practice29_hw1/models/user.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Utils {
  static storeData(String key, dynamic content) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await sharedPreferences.setBool(key, content);
  }

  static Future<bool> getData(String key) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    
    return sharedPreferences.getBool(key) ?? false; 
  }

  static Map<String, dynamic> toJson({required User user}) {
    return {
      "userEmailAddress": user.userEmailAddress,
      "password": user.password
    };
  }

  static storeUser(Map<String, dynamic> user) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    String converted = jsonEncode(user);
    sharedPreferences.setString("user", converted);
  }

  static getUser() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    String? response = sharedPreferences.getString("user");
    final convertBack = jsonDecode(response!);
    return convertBack;
  }

  static d(String value) {
    Logger logger = Logger();
    logger.d(value);
  }
}

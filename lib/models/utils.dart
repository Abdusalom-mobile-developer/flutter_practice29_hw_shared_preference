import 'dart:convert';

import 'package:flutter_practice29_hw1/models/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
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

  static Map<String, String> toJsonSecure({required FullUser user}) {
    return {
      "fullname": user.fullname,
      "email": user.emailAddress,
      "phoneNumber": user.phoneNumber,
      "password": user.password,
      "confirmPassword": user.confirmPassword
    };
  }

  static secureStoreUser(Map<String, String> userInfo) async {
    final secureStorage = FlutterSecureStorage();
    String converted = jsonEncode(userInfo);
    await secureStorage.write(key: "securedUserInfo", value: converted);
  }

  static getSecuredUserInfo() async {
    final secureStorage = FlutterSecureStorage();
    String? response = await secureStorage.read(key: "securedUserInfo");
    final convertBackToJson = jsonDecode(response!);
    return convertBackToJson;
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginController extends GetxController
    with GetSingleTickerProviderStateMixin {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<dynamic> loginUser(
    String email,
    String password,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    http.Response res = await loginUser(email, password);
    if (jsonDecode(res.body)["success"]) {
      final resData = jsonDecode(res.body)["data"];
      prefs.setString('name', resData['name']);
      prefs.setString('user_role', resData['user_role']);
      prefs.setString('id', resData['id']);
      return {"status": true, "message": "success"};
    } else {
      return {"status": false, "message": jsonDecode(res.body)["message"]};
    }
  }
}

import 'package:flutter/material.dart';
import 'package:fuelin_android/services/Auth.service.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginController extends GetxController
    with GetSingleTickerProviderStateMixin, StateMixin {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool isLoading = false.obs;

  Future<dynamic> loginUserController(
    String email,
    String password,
  ) async {
    isLoading.value = true;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    http.Response res = await loginUser(email, password);
    if (jsonDecode(res.body)["success"]) {
      
      final resData = jsonDecode(res.body)["data"];
      prefs.setString('name', resData['name']);
      prefs.setInt('user_role', resData['user_role']);
      prefs.setInt('id', resData['id']);
      isLoading.value = false;
      return {
        "status": true,
        "role": resData['user_role'],
        "message": "success"
      };
    } else {
      isLoading.value = false;
      return {"status": false, "message": jsonDecode(res.body)["message"]};
    }
  }
}

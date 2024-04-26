import 'dart:convert';

import 'package:attendance/utils/dio.interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  Future<dynamic> login(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();

    try {
      var body = {"email": email, "password": password};
      var response = await dioClient().post("students/login", data: body);
      if (response.data != null) {
        var accessToken = response.data['token'];
        prefs.setString('access_token', accessToken);
        var viewProfRes = await dioClient().get("students/viewProfile");
        if (viewProfRes.data != null) {
          prefs.setString(
              "currentUser", json.encode(viewProfRes.data['data']['student']));
        }
      }
      print("response: ${response.data}");
      return response.data;
    } on DioException catch (e) {
      print("EEEEEE caught by the exception : $e");
      throw parseExceptionAndHandle(e);
    }
  }

  Future<dynamic> logout(String email) async {
    try {
      var body = {"email": email};
      var response = await dioClient().post("students/login", data: body);
      return response.data;
    } on DioException catch (e) {
      throw parseExceptionAndHandle(e);
    }
  }
}

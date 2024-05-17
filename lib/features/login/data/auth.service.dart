import 'dart:convert';

import 'package:attendance/core/errors/dio.interceptor.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
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
      print("EEEEEE caught by the exception : ${e.response?.statusCode}");
      throw parseExceptionAndHandle(e);
    }
  }

  Future<Either<String, String>> logout() async {
    final prefs = await SharedPreferences.getInstance();
    var token = await prefs.get('access_token');
    try {
      var body = {'Authorization': 'Bearer $token'};
      var response = await dioClient().get(
        "students/logout",
        options: Options(
          headers: body,
        ),
      );
      return right("logout Successfully");
    } on DioException catch (e) {
      return left(e.message.toString());
    }
  }
}

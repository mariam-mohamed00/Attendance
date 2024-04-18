import 'package:attendance/utils/dio.interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AuthService {
  Future<dynamic> login(String email, String password) async {
    try {
      var body = {"email": email, "password": password};
      var response = await dioClient().post("students/login", data: body);
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

import 'package:attendance/core/errors/dio.interceptor.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangePasswordService {
  Future<Either<String, String>> changePassword(String currentPassword,
      String newPassword, String passwordConfirm) async {
    try {
      var body = {
        "currentPassword": currentPassword,
        "newPassword": newPassword,
        "passwordConfirm": passwordConfirm
      };
      var response =
          await dioClient().post("students/changePassword", data: body);
      print(response.data["message"]);
      final newToken = response.data['token'];
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('access_token', newToken);
      return right(response.data["message"]);
    } on DioException catch (e) {
      print(e.response?.data["message"]);
      return left(e.response?.data["message"]);
    }
  }
}

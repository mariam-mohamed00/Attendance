import 'package:attendance/utils/dio.interceptor.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

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
      return right(response.data["message"]);
    } on DioException catch (e) {
      print(e.response?.data["message"]);
      return left(e.response?.data["message"]);
    }
  }
}

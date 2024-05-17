import 'dart:convert';

import 'package:attendance/core/api/api_constants.dart';
import 'package:attendance/features/home/presentation/views/home_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/utils/dialog_utils.dart';
import '../presentation/views/forget_change_password_screen.dart';
import '../presentation/views/forget_code_screen.dart';

class ApiManager {
  static Future<Response?> forgetPassword(
      {required String email, required BuildContext context}) async {
    var dio = Dio();
    try {
      DialogUtils.showLoading(context, 'Loading..');

      var response = await dio.post(
        '${ApiConstants.baseUrl}${ApiConstants.forgetPasswordApi}',
        data: json.encode({"email": email}),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );
      print(response.data);
      print(response.statusCode);

      DialogUtils.hideLoading(context);
      print('account exist');

      DialogUtils.showMessage(context, response.data['message'],
          posActionName: 'Ok',
          barrierDismissible: false,
          title: response.data['status'], posAction: () {
        Navigator.of(context).pushReplacementNamed(ForgetCodeScreen.routeName,
            arguments: {'email': email});
        print(email);
      });
    } on DioException catch (e) {
      final String errorMessage =
          e.response?.data['message'] ?? 'oops there was an error, try later';
      // throw Exception(errorMessage);
      DialogUtils.hideLoading(context);
      DialogUtils.showMessage(context, errorMessage,
          posActionName: 'Try Again',
          barrierDismissible: false,
          posAction: () => Navigator.pop(context),
          title: '');
      print(errorMessage);
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  static Future<Response?> resendConfirmCode(
      {required BuildContext context}) async {
    var dio = Dio();
    final Map<String, dynamic> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final email = arguments['email'];
    try {
      DialogUtils.showLoading(context, 'Loading..');

      var response = await dio.post(
        '${ApiConstants.baseUrl}${ApiConstants.resendConfirmCode}',
        data: json.encode({"email": email}),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );
      print(response.data);
      print(response.statusCode);

      print('account exist');
      DialogUtils.hideLoading(context);
      print('account exist');

      DialogUtils.showMessage(
        context,
        response.data['message'],
        posActionName: 'Ok',
        barrierDismissible: false,
        title: response.data['status'],
        posAction: () {
          Navigator.pop(context);
        },
      );
    } on DioException catch (e) {
      final String errorMessage =
          e.response?.data['message'] ?? 'oops there was an error, try later';
      DialogUtils.hideLoading(context);
      DialogUtils.showMessage(context, errorMessage,
          posActionName: 'Try Again',
          barrierDismissible: false,
          posAction: () => Navigator.pop(context),
          title: '');
      print(errorMessage);
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  static Future<Response?> confirmationCode(
      {required BuildContext context, required num confirmCode}) async {
    var dio = Dio();
    final Map<String, dynamic> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final email = arguments['email'];
    try {
      DialogUtils.showLoading(context, 'Loading..');
      var response = await dio.post(
        '${ApiConstants.baseUrl}${ApiConstants.confirmPasswordResetCode}',
        data: json.encode({"email": email, "confirmCode": confirmCode}),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );
      print(response.data);
      print(response.statusCode);

      DialogUtils.hideLoading(context);
      print('account exist');

      DialogUtils.showMessage(context, response.data['message'],
          posActionName: 'Ok',
          barrierDismissible: false,
          title: response.data['status'], posAction: () {
        Navigator.of(context).pushReplacementNamed(
            ForgetChangePasswordScreen.routeName,
            arguments: {'email': email});
        print(email);
      });
    } on DioException catch (e) {
      final String errorMessage =
          e.response?.data['message'] ?? 'oops there was an error, try later';
      // throw Exception(errorMessage);
      DialogUtils.hideLoading(context);
      DialogUtils.showMessage(context, errorMessage,
          posActionName: 'Try Again',
          barrierDismissible: false,
          posAction: () => Navigator.pop(context),
          title: '');
      print(errorMessage);
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  static Future<Response?> forgetChangePassword(
      {required BuildContext context,
      required String password,
      required String passwordConfirm}) async {
    var dio = Dio();
    final Map<String, dynamic> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final email = arguments['email'];
    print(email);
    try {
      DialogUtils.showLoading(context, 'Loading..');
      var response = await dio.post(
        '${ApiConstants.baseUrl}${ApiConstants.resetPassword}',
        data: json.encode({
          "email": email,
          "password": password,
          "passwordConfirm": passwordConfirm
        }),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );
      print(response.data);
      print(response.statusCode);

      DialogUtils.hideLoading(context);
      print('account exist');

      DialogUtils.showMessage(context, response.data['message'],
          posActionName: 'Ok',
          barrierDismissible: false,
          title: response.data['status'], posAction: () {
        Navigator.of(context)
            .pushNamedAndRemoveUntil(HomeScreen.routeName, (route) => false);
      });
    } on DioException catch (e) {
      final String errorMessage =
          e.response?.data['message'] ?? 'oops there was an error, try later';
      // throw Exception(errorMessage);
      DialogUtils.hideLoading(context);
      DialogUtils.showMessage(context, errorMessage,
          posActionName: 'Try Again',
          barrierDismissible: false,
          posAction: () => Navigator.pop(context),
          title: '');
      print(errorMessage);
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}

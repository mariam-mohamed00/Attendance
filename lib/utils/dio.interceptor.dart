import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

Dio dioClient() {
  const baseUrl =
      "https://smart-attendance-system-using-qr-code-1.onrender.com/api/v1/"; // should be replaced with base url of your api server
  final Dio baseDio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 30),
    ),
  );
  baseDio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options, requestInterceptor) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var access_token = prefs.get("access_token");
    if (access_token != null) {
      options.headers['Authorization'] = "Bearer $access_token";
    }
    return requestInterceptor.next(options);
  }, onError: (DioException ex, errorInterceptor) {
    return errorInterceptor.next(ex);
  }));
  return baseDio;
}

Exception parseExceptionAndHandle(DioException error) {
  var errorMessageObj = mapError(error);
  if (DioExceptionType.receiveTimeout == error.type ||
      DioExceptionType.connectionTimeout == error.type) {
    return TimeoutException("Network Error");
  } else if (DioExceptionType.badResponse == error.type) {
    return Exception(errorMessageObj['message']);
  } else if (DioExceptionType.unknown == error.type) {
    if (error.message!.contains('SocketException')) {
      throw const SocketException("No Internet Connection");
    }
  } else {
    return Exception(errorMessageObj['message']);
  }
  return Exception(errorMessageObj['message']);
}

Map<String, String> Function(Object) mapError = (Object error) {
  if (error is DioException) {
    var errorString = jsonDecode(error.response.toString());
    if (error.response?.statusCode != null) {
      switch (error.response!.statusCode) {
        case 403:
          var message = errorString['error']['errors'][0]['message'];
          return {
            "message": message ?? "Wrong Credentials!",
          };
        case 400:
          var message = errorString['message'];
          return {
            "message": message ?? "Password is not correct!",
          };
        case 401:
          var message = errorString['error']['errors'][0]['message'];
          return {
            "message": message ?? "You Are Not Allowed!",
          };
        case 404:
          var message = "Not Found";
          return {
            "message": message ?? "Not found!",
          };
        case 422:
          var message = errorString['error']['errors'][0]['message'];
          if (message is Map) {
            return {"message": message.values.toList().first};
          }
          return {"message": errorString['error']['errors'][0]['message']};
        case 409:
          return {"message": errorString['error']['errors'][0]['message']};
        case 400:
          return {"message": errorString['error']['errors'][0]['message']};
      }
    }
  }
  return {
    "message": "Some Thing Went Wrong",
  };
};

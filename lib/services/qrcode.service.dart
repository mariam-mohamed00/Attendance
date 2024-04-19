import 'dart:convert';

import 'package:attendance/utils/dio.interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QRCodeService {
  Future<dynamic> scanQRCode(String qrCode) async {
    try {
      var body = {"qrCode": qrCode};
      var response = await dioClient().post("students/scanQr", data: body);
      return response.data;
    } on DioException catch (e) {
      throw parseExceptionAndHandle(e);
    }
  }
}

import 'package:attendance/utils/dio.interceptor.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class QRCodeService {
  Future<Either<String, String>> scanQRCode(String qrCode) async {
    try {
      var body = {"qrCode": qrCode};
      var response = await dioClient().post("students/scanQr", data: body);
      return right(response.data["message"]);
    } on DioException catch (e) {
      return left(e.response?.data["message"]);
    }
  }
}

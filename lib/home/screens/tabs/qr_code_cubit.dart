import 'package:attendance/services/qrcode.service.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';

part 'qr_code_state.dart';

class QrCodeCubit extends Cubit<QrCodeState> {
  QrCodeCubit() : super(QrCodeInitial());

  Future<void> scanQrCode({required String scannedData}) async {
    Either<String, String> result =
        await QRCodeService().scanQRCode(scannedData);

    result.fold((failed) => emit(QrCodeFailed(failed: failed)),
        (success) => emit(QrCodeSuccess(success: success)));
  }
}

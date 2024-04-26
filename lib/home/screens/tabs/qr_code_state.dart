part of 'qr_code_cubit.dart';

sealed class QrCodeState {}

final class QrCodeInitial extends QrCodeState {}

final class QrCodeLoading extends QrCodeState {}

final class QrCodeSuccess extends QrCodeState {
  final String success;

  QrCodeSuccess({required this.success});
}

final class QrCodeFailed extends QrCodeState {
  final String failed;

  QrCodeFailed({required this.failed});
}

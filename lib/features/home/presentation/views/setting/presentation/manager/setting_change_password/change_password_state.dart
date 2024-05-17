part of 'change_password_cubit.dart';

@immutable
sealed class ChangePasswordState {}

final class ChangePasswordInitial extends ChangePasswordState {}

final class ChangePasswordloading extends ChangePasswordState {}

final class ChangePasswordsuccess extends ChangePasswordState {
  final String success;

  ChangePasswordsuccess({required this.success});
}

final class ChangePasswordFailed extends ChangePasswordState {
  final String failed;

  ChangePasswordFailed({required this.failed});
}

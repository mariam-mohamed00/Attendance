part of 'logout_cubit.dart';

@immutable
sealed class LogoutState {}

final class LogoutInitial extends LogoutState {}

final class Logoutloading extends LogoutState {}

final class Logoutsuccess extends LogoutState {
  final String LogoutState;

  Logoutsuccess({required this.LogoutState});
}

final class LogoutFailed extends LogoutState {
  final String failed;

  LogoutFailed({required this.failed});
}

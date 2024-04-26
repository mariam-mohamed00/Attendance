import 'package:attendance/services/change_password_service.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit() : super(ChangePasswordInitial());

  Future<void> changePassword(
      {required String currentPassword,
      required String newPassword,
      required String confirmPassword}) async {
    Either<String, String> result = await ChangePasswordService()
        .changePassword(currentPassword, newPassword, confirmPassword);

    result.fold((failed) => emit(ChangePasswordFailed(failed: failed)),
        (success) => emit(ChangePasswordsuccess(success: success)));
  }
}

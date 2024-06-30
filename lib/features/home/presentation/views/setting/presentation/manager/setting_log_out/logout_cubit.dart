import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../../../../login/data/auth.service.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit() : super(LogoutInitial());

  Future<void> logout() async {
    Either<String, String> result = await AuthService().logout();
    result.fold((failed) => emit(LogoutFailed(failed: failed)),
        (success) => emit(Logoutsuccess(LogoutState: "Successfully")));
  }
}

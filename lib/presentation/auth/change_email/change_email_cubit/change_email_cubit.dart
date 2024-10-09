import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'change_email_state.dart';

class ChangeEmailCubit extends Cubit<ChangeEmailState> {
  ChangeEmailCubit() : super(ChangeEmailInitial());

  Future<void> updateUserPassword(
    Future<String?> Function() updateUserPassword,
  ) async {
    emit(ChangeEmailLoading());
    final String? errorMessage = await updateUserPassword();
    if (errorMessage == null) {
      emit(ChangeEmailSuccess());
    } else {
      emit(ChangeEmailFailure(errorMessage));
    }
  }
}

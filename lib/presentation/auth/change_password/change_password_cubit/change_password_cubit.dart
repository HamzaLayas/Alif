import 'package:alif/utils/style/alif_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit() : super(ChangePasswordInitial());

  bool isoldPasswordObscured = true;
  bool isNewPasswordObscured = true;
  bool isConfirmNewPasswordObscured = true;

  IconData oldPasswordIcon = AlifIcons.eye_off;
  IconData newPasswordIcon = AlifIcons.eye_off;
  IconData confirmNewPasswordIcon = AlifIcons.eye_off;

  obscureOldPasswordToggle() {
    isoldPasswordObscured = !isoldPasswordObscured;
    if (isoldPasswordObscured) {
      oldPasswordIcon = AlifIcons.eye_off;
    } else {
      oldPasswordIcon = AlifIcons.eye;
    }
    emit(ChangePasswordVisibilityToggle());
    emit(ChangePasswordInitial());
  }

  obscureNewPasswordToggle() {
    isNewPasswordObscured = !isNewPasswordObscured;
    if (isNewPasswordObscured) {
      newPasswordIcon = AlifIcons.eye_off;
    } else {
      newPasswordIcon = AlifIcons.eye;
    }
    emit(ChangePasswordVisibilityToggle());
    emit(ChangePasswordInitial());
  }

  obscureConfirmNewPasswordToggle() {
    isConfirmNewPasswordObscured = !isConfirmNewPasswordObscured;
    if (isConfirmNewPasswordObscured) {
      confirmNewPasswordIcon = AlifIcons.eye_off;
    } else {
      confirmNewPasswordIcon = AlifIcons.eye;
    }
    emit(ChangePasswordVisibilityToggle());
    emit(ChangePasswordInitial());
  }

  Future<void> updateUserPassword(
    Future<String?> Function() updateUserPassword,
  ) async {
    emit(ChangePasswordLoading());
    final String? errorMessage = await updateUserPassword();
    if (errorMessage == null) {
      emit(ChangePasswordSuccess());
    } else {
      emit(ChangePasswordFailure(errorMessage));
    }
  }
}

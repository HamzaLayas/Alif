import 'dart:io';

import 'package:alif/data/repositories/auth_repo.dart';
import 'package:alif/utils/style/alif_icons.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  final _authRepo = GetIt.I.get<AuthRepo>();

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool isPasswordObscured = true;
  IconData passwordIcon = AlifIcons.eye_off;
  bool isConfirmObscured = true;
  IconData confirmPasswordIcon = AlifIcons.eye_off;

  obscurePasswordToggle() {
    isPasswordObscured = !isPasswordObscured;
    if (isPasswordObscured) {
      passwordIcon = AlifIcons.eye_off;
      emit(RegisterPasswordObscured());
    } else {
      passwordIcon = AlifIcons.eye;
      emit(RegisterPasswordVisible());
    }
  }

  obscureConfirmToggle() {
    isConfirmObscured = !isConfirmObscured;
    if (isConfirmObscured) {
      confirmPasswordIcon = AlifIcons.eye_off;
      emit(RegisterConfirmPasswordObscured());
    } else {
      confirmPasswordIcon = AlifIcons.eye;
      emit(RegisterConfirmPasswordVisible());
    }
  }

  register() async {
    final isValidated = formKey.currentState!.validate();

    if (isValidated) {
      emit(RegisterLoading());

      Response? res = await _authRepo.register(
        name: nameController.text.trim(),
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        phone: phoneController.text.trim(),
      );
      if (res!.statusCode == HttpStatus.created) {
        emit(RegisterSuccess());
      } else {
        emit(RegisterFailure(error: res.data['message']));
      }
    }
  }
}

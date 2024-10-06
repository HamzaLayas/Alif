import 'dart:io';

import 'package:alif/data/repositories/auth_repo.dart';
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
  bool isConfirmObscured = true;

  obscurePasswordToggle() {
    isPasswordObscured = !isPasswordObscured;
  }

  obscureConfirmToggle() {
    isConfirmObscured = !isConfirmObscured;
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

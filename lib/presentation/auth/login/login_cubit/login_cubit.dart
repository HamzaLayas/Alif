import 'dart:io';
import 'package:alif/data/repositories/auth_repo.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final _authRepo = GetIt.I.get<AuthRepo>();

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isObscured = true;
  IconData passwordIcon = Icons.lock_outline_rounded;

  obscureToggle() {
    isObscured = !isObscured;
    if (isObscured) {
      passwordIcon = Icons.lock_outline_rounded;
      emit(LoginPasswordObscured());
    } else {
      passwordIcon = Icons.lock_open_rounded;
      emit(LoginPasswordVisible());
    }
  }

  login() async {
    final isValidated = formKey.currentState!.validate();

    if (isValidated) {
      emit(LoginLoading());

      Response? res = await _authRepo.login(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      if (res != null) {
        if (res.statusCode == HttpStatus.ok) {
          emit(LoginSuccess());
          Future.delayed(Duration(seconds: 2));
        } else {
          emit(LoginFailure(error: res.data['message']));
        }
      } else {
        emit(LoginFailure(error: "Something Went Wrong"));
      }
    }
  }
}

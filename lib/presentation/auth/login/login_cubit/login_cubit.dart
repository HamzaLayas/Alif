import 'dart:io';
import 'package:alif/data/repositories/auth_repo.dart';
import 'package:alif/utils/style/alif_icons.dart';
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
  IconData passwordIcon = AlifIcons.eye_off;

  obscureToggle() {
    isObscured = !isObscured;
    if (isObscured) {
      passwordIcon = AlifIcons.eye_off;
      emit(LoginPasswordObscured());
    } else {
      passwordIcon = AlifIcons.eye;
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
          Future.delayed(Duration(seconds: 2));
          emit(LoginSuccess());
        } else {
          emit(LoginFailure(error: res.data['message']));
        }
      } else {
        emit(LoginFailure(error: "Something Went Wrong"));
      }
    }
  }
}
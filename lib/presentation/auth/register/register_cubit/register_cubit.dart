import 'package:alif/data/models/user_model.dart';
import 'package:alif/data/repositories/auth_repo.dart';
import 'package:alif/utils/style/alif_icons.dart';
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
    } else {
      passwordIcon = AlifIcons.eye;
    }
    emit(RegisterPasswordVisiblityToggle());
    emit(RegisterInitial());
  }

  obscureConfirmToggle() {
    isConfirmObscured = !isConfirmObscured;
    if (isConfirmObscured) {
      confirmPasswordIcon = AlifIcons.eye_off;
    } else {
      confirmPasswordIcon = AlifIcons.eye;
    }
    emit(RegisterPasswordVisiblityToggle());
    emit(RegisterInitial());
  }

  register(
    void Function(UserModel newUser) updateCurrentUser,
  ) async {
    final isValidated = formKey.currentState!.validate();
    if (isValidated) {
      emit(RegisterLoading());
      final response = await _authRepo.register(
        name: nameController.text.trim(),
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        phone: phoneController.text.trim(),
      );
      if (response.data != null) {
        updateCurrentUser(response.data!);
        await Future.delayed(Duration(seconds: 2));
        emit(RegisterSuccess());
      } else {
        emit(RegisterFailure(error: response.error!));
      }
    }
  }
}

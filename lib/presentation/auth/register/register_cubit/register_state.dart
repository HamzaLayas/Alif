part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterLoading extends RegisterState {}

final class RegisterSuccess extends RegisterState {}

final class RegisterFailure extends RegisterState {
  final String error;
  RegisterFailure({required this.error});
}

final class RegisterPasswordObscured extends RegisterState {}

final class RegisterPasswordVisible extends RegisterState {}

final class RegisterConfirmPasswordObscured extends RegisterState {}

final class RegisterConfirmPasswordVisible extends RegisterState {}
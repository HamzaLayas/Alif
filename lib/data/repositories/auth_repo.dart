import 'dart:io';
import 'package:alif/data/models/user_model.dart';
import 'package:alif/data/providers/auth_provider.dart';
import 'package:alif/utils/constants/response_handler.dart';

class AuthRepo {
  final _authProvider = AuthProvider();

  Future<ResponseHandler<UserModel>> login({
    required String email,
    required String password,
  }) async {
    final response = await _authProvider.login(
      email: email,
      password: password,
    );
    if (response.statusCode == HttpStatus.ok) {
      return ResponseHandler(
        data: UserModel.fromMap(response.data['data']['user']),
      );
    } else {
      return ResponseHandler(error: response.data['message']);
    }
  }

  Future<ResponseHandler<UserModel>> register({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    final response = await _authProvider.register(
      name: name,
      email: email,
      password: password,
      phone: phone,
    );
    if (response.statusCode == HttpStatus.created) {
      return ResponseHandler(
        data: UserModel.fromMap(response.data['data']['user']),
      );
    } else {
      return ResponseHandler(error: response.data['message']);
    }
  }
}

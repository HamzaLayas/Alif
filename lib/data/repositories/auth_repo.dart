import 'package:alif/data/providers/auth_provider.dart';
import 'package:dio/dio.dart';

class AuthRepo {
  final _authProvider = AuthProvider();

  Future<Response?> login({
    required String email,
    required String password,
  }) async {
    // try {
    final response = await _authProvider.login(
      email: email,
      password: password,
    );
    return response;
    // } on DioException catch (e) {
    //   return e.response;
    // }
  }

  Future<Response?> register({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    // try {
      final response = _authProvider.register(
        name: name,
        email: email,
        password: password,
        phone: phone,
      );
      return response;
    // } on DioException catch (e) {
    //   return e.response;
    // }
  }
}

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class AuthProvider {
  final Dio client = GetIt.instance.get<Dio>();

  Future<Response?> login({
    required String email,
    required String password,
  }) async {
    try {
      Response res = await client.post("auth/login", data: {
        'email': email,
        'password': password,
      });
      return res;
    } on DioException catch (error) {
      return error.response;
    }
  }

  Future<Response?> register({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    try {
      Response res = await client.post("auth/signup", data: {
        'name': name,
        'email': email,
        'password': password,
        'phone': phone,
      });
      return res;
    } on DioException catch (error) {
      return error.response;
    }
  }
}

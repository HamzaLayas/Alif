import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class UserProvider {
  final Dio client = GetIt.instance.get<Dio>();

  Future<Response> getUserData() async {
    try {
      Response response = await client.get('user');
      return response;
    } on DioException catch (e) {
      return e.response!;
    }
  }

  Future<Response> updateUserData({required FormData data}) async {
    try {
      print(data);
      Response res = await client.put('user', data: data);
      return res;
    } on DioException catch (e) {
      return e.response!;
    }
  }

  Future<Response> updateUserPassword(
      {required Map<String, dynamic> map}) async {
    try {
      Response res = await client.put('user', data: map);
      return res;
    } on DioException catch (e) {
      return e.response!;
    }
  }
}

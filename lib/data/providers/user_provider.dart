import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class UserProvider {
  final Dio client = GetIt.instance.get<Dio>();

  Future<Response> getUserData() async {
    try {
      Response res = await client.get('user');
      return res;
    } on DioException catch (e) {
      return e.response!;
    }
  }
}

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    final data = response.data as Map<String, dynamic>;

    if (data.containsKey("token")) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if (prefs.containsKey('token')) {
        await prefs.remove('token');
      }
      await prefs.setString('token', data['token']);
    }
    super.onResponse(response, handler);
  }

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('token')) {
      String token = prefs.getString('token')!;

      options.headers["Authorization"] = "Bearer $token";
    }
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // TODO: implement onError
    super.onError(err, handler);
  }
}

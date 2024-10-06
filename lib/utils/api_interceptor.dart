import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiInterceptor extends Interceptor {

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    final data = response.data as Map<String, dynamic>;

    if (data.containsKey("token")) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', data['token']);
      print(data['token']);
    }
    super.onResponse(response, handler);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // TODO: implement onRequest
    super.onRequest(options, handler);
  }
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // TODO: implement onError
    super.onError(err, handler);
  }
}

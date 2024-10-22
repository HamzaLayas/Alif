import 'package:alif/data/repositories/auth_repo.dart';
import 'package:alif/data/repositories/service_repo.dart';
import 'package:alif/data/repositories/user_repo.dart';
import 'package:alif/utils/api_interceptor.dart';
import 'package:alif/utils/constants/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DependencyInjection {
  static init() {
    final GetIt getIt = GetIt.instance;
    final Dio dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));

    dio.interceptors.addAll([
      ApiInterceptor(),
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        enabled: kDebugMode,
      ),
    ]);

    getIt.registerLazySingleton<Dio>(() => dio);

    //models

    // repositories
    getIt.registerLazySingleton<AuthRepo>(() => AuthRepo());
    getIt.registerLazySingleton<ServiceRepo>(() => ServiceRepo());
    getIt.registerLazySingleton<UserRepo>(() => UserRepo());
  }
}

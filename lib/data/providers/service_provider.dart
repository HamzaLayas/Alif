import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class ServiceProvider {
  final Dio client = GetIt.instance.get<Dio>();

  Future<Response> getServiceTypes() async {
    try {
      Response response = await client.get('service/type/');
      return response;
    } on DioException catch (e) {
      return e.response!;
    }
  }

  Future<Response> getServiceCategories() async {
    try {
      Response response = await client.get('service/categories/');
      return response;
    } on DioException catch (e) {
      return e.response!;
    }
  }

  Future<Response> getFilteredServices() async {
    try {
      Response response = await client.get('service/all');
      return response;
    } on DioException catch (e) {
      return e.response!;
    }
  }

  Future<Response> getServices() async {
    try {
      Response response = await client.get('service/all');
      return response;
    } on DioException catch (e) {
      return e.response!;
    }
  }

  Future<Response> getSavedServices() async {
    try {
      Response response = await client.get('favorite/');
      return response;
    } on DioException catch (e) {
      return e.response!;
    }
  }

  Future<Response> getFeaturedServices() async {
    try {
      Response response = await client.get('service/all?isFeatured=true');
      return response;
    } on DioException catch (e) {
      return e.response!;
    }
  }

  Future<Response> getTrendingServices() async {
    try {
      Response response =
          await client.get('service/all?sort=-1&requestLimit=5');
      return response;
    } on DioException catch (e) {
      return e.response!;
    }
  }

  Future<Response> getNewServices() async {
    try {
      Response response =
          await client.get('service/all?sort=-1&requestLimit=5');
      return response;
    } on DioException catch (e) {
      return e.response!;
    }
  }
}

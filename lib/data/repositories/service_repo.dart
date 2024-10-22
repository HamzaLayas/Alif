import 'dart:io';
import 'package:alif/data/models/service_category_model.dart';
import 'package:alif/data/models/service_model.dart';
import 'package:alif/data/models/service_type_model.dart';
import 'package:alif/data/providers/service_provider.dart';
import 'package:alif/utils/constants/response_handler.dart';

class ServiceRepo {
  final _serviceProvider = ServiceProvider();

  Future<ResponseHandler<List<ServiceTypeModel>>> getServiceType() async {
    final response = await _serviceProvider.getServiceTypes();
    if (response.statusCode == HttpStatus.ok) {
      final data = response.data['data']['data'];

      final types = List<ServiceTypeModel>.from(
        data.map((e) => ServiceTypeModel.fromMap(e as Map<String, dynamic>)),
      ).toList();

      return ResponseHandler<List<ServiceTypeModel>>(data: types);
    } else {
      return ResponseHandler(error: response.data['message']);
    }
  }

  Future<ResponseHandler<List<ServiceCategoryModel>>>
      getServiceCategories() async {
    final response = await _serviceProvider.getServiceCategories();
    if (response.statusCode == HttpStatus.ok) {
      final data = response.data['data']['data'];

      final categories = List<ServiceCategoryModel>.from(
        data.map(
            (e) => ServiceCategoryModel.fromMap(e as Map<String, dynamic>)),
      ).toList();

      return ResponseHandler<List<ServiceCategoryModel>>(data: categories);
    } else {
      return ResponseHandler(error: response.data['message']);
    }
  }

  Future<ResponseHandler<List<ServiceModel>>> getServices() async {
    final response = await _serviceProvider.getServices();
    if (response.statusCode == HttpStatus.ok) {
      final data = response.data['data']['data'];

      final services = List<ServiceModel>.from(
        data.map((e) => ServiceModel.fromMap(e as Map<String, dynamic>)),
      ).toList();

      return ResponseHandler<List<ServiceModel>>(data: services);
    } else {
      return ResponseHandler(error: response.data['message']);
    }
  }

  Future<ResponseHandler<List<ServiceModel>>> getSavedServices() async {
    final response = await _serviceProvider.getSavedServices();
    if (response.statusCode == HttpStatus.ok) {
      final data = response.data['data']['data'];

      final services = List<ServiceModel>.from(
        data.map((e) => ServiceModel.fromMap(e as Map<String, dynamic>)),
      ).toList();

      return ResponseHandler<List<ServiceModel>>(data: services);
    } else {
      return ResponseHandler(error: response.data['message']);
    }
  }

  Future<ResponseHandler<List<ServiceModel>>> getFeaturedServices() async {
    final response = await _serviceProvider.getFeaturedServices();
    if (response.statusCode == HttpStatus.ok) {
      final data = response.data['data']['data'];

      final services = List<ServiceModel>.from(
        data.map((e) => ServiceModel.fromMap(e as Map<String, dynamic>)),
      ).toList();

      return ResponseHandler<List<ServiceModel>>(data: services);
    } else {
      return ResponseHandler(error: response.data['message']);
    }
  }

  Future<ResponseHandler<List<ServiceModel>>> getTrendingServices() async {
    final response = await _serviceProvider.getTrendingServices();
    if (response.statusCode == HttpStatus.ok) {
      final data = response.data['data']['data'];

      final services = List<ServiceModel>.from(
        data.map((e) => ServiceModel.fromMap(e as Map<String, dynamic>)),
      ).toList();

      return ResponseHandler<List<ServiceModel>>(data: services);
    } else {
      return ResponseHandler(error: response.data['message']);
    }
  }

  Future<ResponseHandler<List<ServiceModel>>> getNewServices() async {
    final response = await _serviceProvider.getNewServices();
    if (response.statusCode == HttpStatus.ok) {
      final data = response.data['data']['data'];

      final services = List<ServiceModel>.from(
        data.map((e) => ServiceModel.fromMap(e as Map<String, dynamic>)),
      ).toList();

      return ResponseHandler<List<ServiceModel>>(data: services);
    } else {
      return ResponseHandler(error: response.data['message']);
    }
  }
}

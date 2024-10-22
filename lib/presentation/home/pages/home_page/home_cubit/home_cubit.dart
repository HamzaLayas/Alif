import 'package:alif/data/models/service_model.dart';
import 'package:alif/data/repositories/service_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

part 'home_state.dart';

final _getIt = GetIt.I;

class HomeCubit extends Cubit<HomeState> {
  final _serviceRepo = _getIt.get<ServiceRepo>();
  List<ServiceModel> featuredServices = [];
  List<ServiceModel> trendingServices = [];
  List<ServiceModel> newServices = [];
  HomeCubit() : super(HomeInitial()) {
    getHomeData();
  }

  getHomeData() async {
    await Future.wait([
      getFeaturedServices(),
      getTrendingServies(),
      getNewServices(),
    ]).then((value) {
      if (featuredServices.isNotEmpty &&
          trendingServices.isNotEmpty &&
          newServices.isNotEmpty) {
        emit(HomeSuccess());
      } else {
        emit(HomeFailure());
      }
    });
  }

  Future<void> getFeaturedServices() async {
    final response = await _serviceRepo.getFeaturedServices();
    if (response.data != null) {
      featuredServices = response.data as List<ServiceModel>;
    } else {
      emit(HomeFailure());
    }
  }

  Future<void> getTrendingServies() async {
    final response = await _serviceRepo.getTrendingServices();
    if (response.data != null) {
      trendingServices = response.data as List<ServiceModel>;
    } else {
      emit(HomeFailure());
    }
  }

  Future<void> getNewServices() async {
    final response = await _serviceRepo.getNewServices();
    if (response.data != null) {
      newServices = response.data as List<ServiceModel>;
    } else {
      emit(HomeFailure());
    }
  }
}

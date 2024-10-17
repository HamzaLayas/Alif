import 'package:alif/data/models/service_type_model.dart';
import 'package:alif/data/repositories/service_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

part 'explore_state.dart';

final _getIt = GetIt.I;

class ExploreCubit extends Cubit<ExploreState> {
  final _serviceRepo = _getIt.get<ServiceRepo>();
  List<ServiceTypeModel> types = [];
  ExploreCubit() : super(ExploreInitial()) {
    getServiceTypes();
  }

  getServiceTypes() async {
    final response = await _serviceRepo.getServiceType();
    if (response.data != null) {
      types = response.data as List<ServiceTypeModel>;
      if (types.isNotEmpty) {
        emit(ExploreSuccess());
      } else {
        emit(ExploreEmpty());
      }
    } else {
      emit(ExploreFailure());
    }
  }
}

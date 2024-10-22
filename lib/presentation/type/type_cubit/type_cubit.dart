import 'package:alif/data/models/service_model.dart';
import 'package:alif/data/repositories/service_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

part 'type_state.dart';

final _getIt = GetIt.I;

class TypeCubit extends Cubit<TypeState> {
  final _serviceRepo = _getIt.get<ServiceRepo>();
  List<ServiceModel> services = [];
  TypeCubit() : super(TypeInitial()) {
    getServices();
  }

  getServices() async {
    final response = await _serviceRepo.getSavedServices();
    if (response.data != null) {
      services = response.data as List<ServiceModel>;
      if (services.isNotEmpty) {
        emit(TypeEmpty());
      } else {
        emit(TypeEmpty());
      }
    } else {
      emit(TypeFailure());
    }
  }
}

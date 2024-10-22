import 'package:alif/data/models/service_model.dart';
import 'package:alif/data/repositories/service_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
part 'saved_state.dart';

final _getIt = GetIt.I;

class SavedCubit extends Cubit<SavedState> {
  final _serviceRepo = _getIt.get<ServiceRepo>();
  List<ServiceModel> saved = [];
  SavedCubit() : super(SavedInitial()) {
    getSavedService();
  }

  getSavedService() async {
    final response = await _serviceRepo.getSavedServices();
    if (response.data != null) {
      saved = response.data as List<ServiceModel>;
      if (saved.isNotEmpty) {
        emit(SavedSuccess());
      } else {
        emit(SavedEmpty());
      }
    } else {
      emit(SavedFailure());
    }
  }
}

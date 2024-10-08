import 'package:flutter_bloc/flutter_bloc.dart';
part 'saved_state.dart';

class SavedCubit extends Cubit<SavedState> {
  SavedCubit() : super(SavedInitial());
}

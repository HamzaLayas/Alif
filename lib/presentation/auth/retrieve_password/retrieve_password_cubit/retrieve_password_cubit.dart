import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'retrieve_password_state.dart';

class RetrievePasswordCubit extends Cubit<RetrievePasswordState> {
  RetrievePasswordCubit() : super(RetrievePasswordInitial());
}

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'service_details_state.dart';

class ServiceDetailsCubit extends Cubit<ServiceDetailsState> {
  ServiceDetailsCubit() : super(ServiceDetailsInitial());
}

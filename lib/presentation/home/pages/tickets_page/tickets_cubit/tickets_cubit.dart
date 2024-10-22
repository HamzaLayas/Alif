

import 'package:flutter_bloc/flutter_bloc.dart';

part 'tickets_state.dart';

class TicketsCubit extends Cubit<TicketsState> {
  TicketsCubit() : super(TicketsInitial());
}

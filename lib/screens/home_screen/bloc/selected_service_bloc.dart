import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/screens/home_screen/bloc/selected_service_event.dart';
import 'package:flutter_bloc_example/screens/home_screen/bloc/selected_service_state.dart';

class SelectedServiceBloc
    extends Bloc<SelectedServiceEvent, SelectedServiceState> {
  SelectedServiceBloc() : super(SelectedServiceState(service: "All")) {
    on(_onSelected);
  }

  _onSelected(
      SetSelectedServiceEvent event, Emitter<SelectedServiceState> emit) {
    emit(state.copyWith(service: event.service));
  }
}

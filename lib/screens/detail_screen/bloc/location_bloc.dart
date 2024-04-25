import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/screens/detail_screen/bloc/location_event.dart';
import 'package:flutter_bloc_example/screens/detail_screen/bloc/location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc() : super(LocationState()) {
    on<CoordinatesEvent>(_onCoordinates);
  }

  _onCoordinates(CoordinatesEvent event, Emitter<LocationState> emit) async {
    if (event.location != null) {
      emit(state.copyWith(location: event.location));
    }
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/screens/detail_screen/bloc/about_event.dart';
import 'package:flutter_bloc_example/screens/detail_screen/bloc/about_state.dart';

class AboutBloc extends Bloc<AboutEvent, AboutState> {
  AboutBloc() : super(AboutState(about: "")) {
    on<ReadMoreEvent>(_onReadMore);

    on<ToggleEvent>(_onToggle);
  }

  _onReadMore(ReadMoreEvent event, Emitter<AboutState> emit) {
    if (state.isMore == true) {
      emit(state.copyWith(about: event.about));
    } else {
      emit(state.copyWith(about: event.about!.substring(0, 120)));
    }
  }

  _onToggle(ToggleEvent event, Emitter<AboutState> emit) {
    emit(state.copyWith(isMore: event.isMore));
  }
}

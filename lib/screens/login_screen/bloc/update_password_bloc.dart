import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/constants/app_regX.dart';
import 'package:flutter_bloc_example/screens/login_screen/bloc/update_password_event.dart';
import 'package:flutter_bloc_example/screens/login_screen/bloc/update_password_state.dart';

class UpdatePasswordBloc
    extends Bloc<UpdatePasswordEvent, UpdatePasswordState> {
  UpdatePasswordBloc() : super(UpdatePasswordState()) {
    on<EmailEvent>(_onNewPassword);
  }

  final AppRegX _regX = AppRegX();

  _onNewPassword(EmailEvent event, Emitter<UpdatePasswordState> emit) {
    if (_regX.emailRegX.hasMatch(event.email!)) {
      emit(state.copyWith(email: event.email));
    } else {
      emit(state.copyWith(email: null));
    }
  }
}

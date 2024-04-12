import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/constants/app_regX.dart';
import 'package:flutter_bloc_example/screens/login_screen/bloc/sign_in_event.dart';
import 'package:flutter_bloc_example/screens/login_screen/bloc/sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(const SignInState()) {
    on<EmailEvent>(_emailEvent);

    on<PasswordEvent>(_passwordEvent);
  }

  final AppRegX _appRegX = AppRegX();

  _emailEvent(EmailEvent event, Emitter<SignInState> emit) {
    if (_appRegX.emailRegX.hasMatch(event.email!)) {
      emit(state.copyWith(email: event.email));
    } else {
      emit(state.copyWith(email: null));
    }
  }

  _passwordEvent(PasswordEvent event, Emitter<SignInState> emit) {
    if (_appRegX.passwordRegX.hasMatch(event.password!)) {
      emit(state.copyWith(password: event.password));
    } else {
      emit(state.copyWith(password: null));
    }
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/screens/register_screen/bloc/signUp_event.dart';
import 'package:flutter_bloc_example/screens/register_screen/model/signUp_model.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpModel> {
  SignUpBloc() : super(const SignUpModel()) {
    on<EmailEvent>((event, emit) {
      emit(state.copyWith(email: event.email));
    });

    on<PasswordEvent>((event, emit) {
      emit(state.copyWith(password: event.password));
    });

    on<ConfirmPasswordEvent>((event, emit) {
      emit(state.copyWith(confirmPassword: event.confirmPassword));
    });
  }
}

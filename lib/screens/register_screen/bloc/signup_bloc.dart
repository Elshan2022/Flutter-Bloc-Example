import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/constants/app_regX.dart';
import 'package:flutter_bloc_example/screens/register_screen/bloc/signUp_event.dart';
import 'package:flutter_bloc_example/screens/register_screen/model/signUp_model.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpModel> {
  SignUpBloc() : super(const SignUpModel()) {
    on<EmailEvent>(_onEmail);

    on<PasswordEvent>(_onPassword);

    on<ConfirmPasswordEvent>(_onRePassword);

    on<NameEvent>(_onName);

    on<SurnameEvent>(_onSurname);

    on<PhoneNumberEvent>(_onPhoneNumber);
  }

  final _regX = AppRegX();

  _onEmail(EmailEvent event, Emitter<SignUpModel> emit) {
    if (_regX.emailRegX.hasMatch(event.email!)) {
      emit(state.copyWith(email: event.email));
    } else {
      emit(state.copyWith(email: null));
    }
  }

  _onRePassword(ConfirmPasswordEvent event, Emitter<SignUpModel> emit) {
    if (_regX.passwordRegX.hasMatch(event.confirmPassword!)) {
      emit(state.copyWith(confirmPassword: event.confirmPassword));
    } else {
      emit(state.copyWith(confirmPassword: null));
    }
  }

  _onPassword(PasswordEvent event, Emitter<SignUpModel> emit) {
    if (_regX.passwordRegX.hasMatch(event.password!)) {
      emit(state.copyWith(password: event.password));
    } else {
      emit(state.copyWith(password: null));
    }
  }

  _onName(NameEvent event, Emitter<SignUpModel> emit) {
    if (event.name!.isNotEmpty && event.name!.length > 3) {
      emit(state.copyWith(name: event.name));
    } else {
      emit(state.copyWith(name: null));
    }
  }

  _onPhoneNumber(PhoneNumberEvent event, Emitter<SignUpModel> emit) {
    if (_regX.phoneNumber.hasMatch(event.phoneNumber!)) {
      emit(state.copyWith(phoneNumber: event.phoneNumber));
    } else {
      emit(state.copyWith(phoneNumber: null));
    }
  }

  _onSurname(SurnameEvent event, Emitter<SignUpModel> emit) {
    if (event.surname!.isNotEmpty && event.surname!.length > 3) {
      emit(state.copyWith(surname: event.surname));
    } else {
      emit(state.copyWith(surname: null));
    }
  }
}

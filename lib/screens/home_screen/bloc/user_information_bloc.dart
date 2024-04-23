import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/screens/home_screen/bloc/user_information_event.dart';
import 'package:flutter_bloc_example/screens/home_screen/bloc/user_information_state.dart';

class UserInformationBloc
    extends Bloc<UserInformationEvent, UserInformationState> {
  UserInformationBloc() : super(const UserInformationState()) {
    on<NameEvent>(_onName);
    on<SurnameEvent>(_onSurname);
    on<EmailEvent>(_onEmail);
    on<PhoneNumberEvent>(_onPhoneNumber);
    on<UserImageEvent>(_onUserImage);
  }

  _onName(NameEvent event, Emitter<UserInformationState> emit) {
    if (event.name != null) {
      emit(state.copyWith(name: event.name));
    }
  }

  _onSurname(SurnameEvent event, Emitter<UserInformationState> emit) {
    if (event.surname != null) {
      emit(state.copyWith(surname: event.surname));
    }
  }

  _onEmail(EmailEvent event, Emitter<UserInformationState> emit) {
    if (event.email != null) {
      emit(state.copyWith(email: event.email));
    }
  }

  _onPhoneNumber(PhoneNumberEvent event, Emitter<UserInformationState> emit) {
    if (event.phoneNumber != null) {
      emit(state.copyWith(phoneNumber: event.phoneNumber));
    }
  }

  _onUserImage(UserImageEvent event, Emitter<UserInformationState> emit) {
    if (event.imageUrl != null) {
      emit(state.copyWith(imageUrl: event.imageUrl));
    } else {
      emit(state.copyWith(imageUrl: null));
    }
  }
}

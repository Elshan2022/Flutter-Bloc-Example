// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: file_names

sealed class SignUpEvent {}

class EmailEvent extends SignUpEvent {
  String? email;
  EmailEvent({required this.email});
}

class PasswordEvent extends SignUpEvent {
  String? password;
  PasswordEvent({required this.password});
}

class ConfirmPasswordEvent extends SignUpEvent {
  String? confirmPassword;
  ConfirmPasswordEvent({required this.confirmPassword});
}

class NameEvent extends SignUpEvent {
  String? name;
  NameEvent({required this.name});
}

class SurnameEvent extends SignUpEvent {
  String? surname;
  SurnameEvent({required this.surname});
}

class PhoneNumberEvent extends SignUpEvent {
  String? phoneNumber;
  PhoneNumberEvent({required this.phoneNumber});
}

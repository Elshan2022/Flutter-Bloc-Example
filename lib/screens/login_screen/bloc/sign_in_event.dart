// ignore_for_file: public_member_api_docs, sort_constructors_first
sealed class SignInEvent {}

class EmailEvent extends SignInEvent {
  String? email;
  EmailEvent({this.email});
}

class PasswordEvent extends SignInEvent {
  String? password;
  PasswordEvent({this.password});
}

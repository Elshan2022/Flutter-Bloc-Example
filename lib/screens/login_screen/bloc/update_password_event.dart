// ignore_for_file: public_member_api_docs, sort_constructors_first
sealed class UpdatePasswordEvent {}

class EmailEvent extends UpdatePasswordEvent {
  String? email;
  EmailEvent({this.email});
}

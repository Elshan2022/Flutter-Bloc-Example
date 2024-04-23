// ignore_for_file: public_member_api_docs, sort_constructors_first
sealed class UserInformationEvent {}

class EmailEvent extends UserInformationEvent {
  String? email;
  EmailEvent({this.email});
}

class NameEvent extends UserInformationEvent {
  String? name;
  NameEvent({this.name});
}

class SurnameEvent extends UserInformationEvent {
  String? surname;
  SurnameEvent({this.surname});
}

class PhoneNumberEvent extends UserInformationEvent {
  String? phoneNumber;
  PhoneNumberEvent({this.phoneNumber});
}

class UserImageEvent extends UserInformationEvent {
  String? imageUrl;
  UserImageEvent({this.imageUrl});
}

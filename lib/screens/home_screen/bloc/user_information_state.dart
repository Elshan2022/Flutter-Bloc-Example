// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class UserInformationState extends Equatable {
  final String? name;
  final String? surname;
  final String? email;
  final String? phoneNumber;
  final String? imageUrl;

  const UserInformationState({
    this.name,
    this.surname,
    this.email,
    this.phoneNumber,
    this.imageUrl,
  });

  UserInformationState copyWith({
    String? name,
    String? surname,
    String? email,
    String? phoneNumber,
    String? imageUrl,
  }) {
    return UserInformationState(
      name: name ?? this.name,
      surname: surname ?? this.surname,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  @override
  List<Object?> get props => [name, surname, email, phoneNumber, imageUrl];
}

class UpdatePasswordState {
  String? email;

  UpdatePasswordState({this.email});

  UpdatePasswordState copyWith({String? email}) {
    return UpdatePasswordState(
      email: email ?? this.email,
    );
  }
}

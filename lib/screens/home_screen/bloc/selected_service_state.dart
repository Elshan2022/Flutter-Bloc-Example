// ignore_for_file: public_member_api_docs, sort_constructors_first
class SelectedServiceState {
  String? service;
  SelectedServiceState({this.service});

  SelectedServiceState copyWith({
    String? service,
  }) {
    return SelectedServiceState(
      service: service ?? this.service,
    );
  }
}

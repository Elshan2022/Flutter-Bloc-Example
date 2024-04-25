// ignore_for_file: public_member_api_docs, sort_constructors_first
class LocationState {
  String? location;
  LocationState({this.location});

  LocationState copyWith({
    String? location,
  }) {
    return LocationState(
      location: location ?? this.location,
    );
  }
}

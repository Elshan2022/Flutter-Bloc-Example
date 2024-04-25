// ignore_for_file: public_member_api_docs, sort_constructors_first
sealed class LocationEvent {}

class CoordinatesEvent extends LocationEvent {
  String? location;
  CoordinatesEvent({this.location});
}

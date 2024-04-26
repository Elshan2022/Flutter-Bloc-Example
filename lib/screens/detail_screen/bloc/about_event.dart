// ignore_for_file: public_member_api_docs, sort_constructors_first
sealed class AboutEvent {}

class ReadMoreEvent extends AboutEvent {
  String? about;
  ReadMoreEvent({this.about});
}

class ToggleEvent extends AboutEvent {
  bool? isMore;
  ToggleEvent({this.isMore});
}

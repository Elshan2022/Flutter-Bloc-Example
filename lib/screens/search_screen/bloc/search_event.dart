// ignore_for_file: public_member_api_docs, sort_constructors_first
sealed class SearchEvent {}

class SearchingItemEvent extends SearchEvent {
  String? query;
  SearchingItemEvent({this.query});
}

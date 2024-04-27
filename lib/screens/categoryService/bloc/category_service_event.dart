// ignore_for_file: public_member_api_docs, sort_constructors_first
sealed class CategoryServiceEvent {}

class GetCategoryServiceEvent extends CategoryServiceEvent {
  String? category;
  GetCategoryServiceEvent({this.category});
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
sealed class ServicesByCategoryEvent {}

class GetServicesByCategoryEvent extends ServicesByCategoryEvent {
  String? category;
  GetServicesByCategoryEvent({this.category});
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc_example/model/service_model.dart';

class SearchState {
  List<ServiceModel>? services;
  SearchState({this.services});

  SearchState copyWith({
    List<ServiceModel>? services,
  }) {
    return SearchState(
      services: services ?? this.services,
    );
  }
}

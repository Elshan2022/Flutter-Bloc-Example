// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc_example/model/service_model.dart';

class ServicesByCategoryState {
  List<ServiceModel>? services;
  ServicesByCategoryState({this.services});

  ServicesByCategoryState copyWith({
    List<ServiceModel>? services,
  }) {
    return ServicesByCategoryState(
      services: services ?? this.services,
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc_example/model/service_model.dart';

class CategoryServiceState {
  List<ServiceModel>? categoryServices;
  CategoryServiceState({this.categoryServices});

  CategoryServiceState copyWith({List<ServiceModel>? categoryServices}) {
    return CategoryServiceState(
      categoryServices: categoryServices ?? this.categoryServices,
    );
  }
}

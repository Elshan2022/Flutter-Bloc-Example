import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/mock/services_list.dart';
import 'package:flutter_bloc_example/screens/home_screen/bloc/services_by_category_event.dart';
import 'package:flutter_bloc_example/screens/home_screen/bloc/services_by_category_state.dart';

class ServicesByCategoryBloc
    extends Bloc<ServicesByCategoryEvent, ServicesByCategoryState> {
  ServicesByCategoryBloc() : super(ServicesByCategoryState(services: [])) {
    on<GetServicesByCategoryEvent>(_onCategory);
  }

  final List<ServiceModel> _servicesList = ServiceModel.serviceList;

  _onCategory(
      GetServicesByCategoryEvent event, Emitter<ServicesByCategoryState> emit) {
    if (event.category == "All") {
      emit(state.copyWith(services: _servicesList));
      return;
    }

    final categoryList = _servicesList.where((element) {
      return element.field == event.category;
    }).toList();

    emit(state.copyWith(services: categoryList));
  }
}

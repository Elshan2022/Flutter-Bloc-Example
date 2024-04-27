import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/mock/services_list.dart';
import 'package:flutter_bloc_example/screens/categoryService/bloc/category_service_event.dart';
import 'package:flutter_bloc_example/screens/categoryService/bloc/category_service_state.dart';

class CategoryServiceBloc
    extends Bloc<CategoryServiceEvent, CategoryServiceState> {
  CategoryServiceBloc() : super(CategoryServiceState(categoryServices: [])) {
    on<GetCategoryServiceEvent>(_onGetCategory);
  }

  final List<ServiceModel> _services = ServiceModel.serviceList;

  _onGetCategory(
      GetCategoryServiceEvent event, Emitter<CategoryServiceState> emit) {
    final categoryList = _services.where((element) {
      final field = element.field?.toUpperCase() ?? "";
      final category = event.category?.toUpperCase() ?? "";

      return field.contains(category);
    }).toList();

    if (categoryList.isNotEmpty) {
      emit(state.copyWith(categoryServices: categoryList));
    } else {
      emit(state.copyWith(categoryServices: []));
    }
  }
}

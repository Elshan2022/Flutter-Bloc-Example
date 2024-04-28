import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/mock/services_list.dart';
import 'package:flutter_bloc_example/model/service_model.dart';
import 'package:flutter_bloc_example/screens/search_screen/bloc/search_event.dart';
import 'package:flutter_bloc_example/screens/search_screen/bloc/search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchState(services: [])) {
    on<SearchingItemEvent>(_onSearch);
  }

  final List<ServiceModel> _services = ServiceList.serviceList;

  _onSearch(SearchingItemEvent event, Emitter<SearchState> emit) {
    final searchList = _services.where((element) {
      final query = event.query!.toUpperCase();
      final service = element.field!.toUpperCase();
      return service.contains(query);
    }).toList();

    emit(state.copyWith(services: searchList));
  }
}

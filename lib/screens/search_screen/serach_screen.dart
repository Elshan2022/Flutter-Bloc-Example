import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/common/custom_textField.dart';
import 'package:flutter_bloc_example/mock/services_list.dart';
import 'package:flutter_bloc_example/screens/home_screen/widget/user_information_cart.dart';
import 'package:flutter_bloc_example/screens/search_screen/bloc/search_bloc.dart';
import 'package:flutter_bloc_example/screens/search_screen/bloc/search_event.dart';
import 'package:flutter_bloc_example/screens/search_screen/bloc/search_state.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final List<ServiceModel> _services = ServiceModel.serviceList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(left: 16, right: 16, top: 30),
        child: SingleChildScrollView(
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              return Column(
                children: [
                  CustomTextField(
                    hintText: "Search",
                    padding: 15,
                    isVisibleSuffix: true,
                    suffixIcon: const Icon(Icons.search),
                    onChanged: (service) {
                      debugPrint("Searching item $service");
                      context
                          .read<SearchBloc>()
                          .add(SearchingItemEvent(query: service));
                    },
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.services!.isEmpty
                        ? _services.length
                        : state.services!.length,
                    itemBuilder: (context, index) {
                      final item = state.services!.isEmpty
                          ? _services.elementAt(index)
                          : state.services!.elementAt(index);
                      return EmployerInformationCart(
                        imagePath: item.image ?? "",
                        name: item.name ?? "",
                        surname: item.surname ?? "",
                        field: item.field ?? "",
                        salary: item.salary ?? "",
                        raking: item.ratingRank ?? "",
                        onTap: () {},
                      );
                    },
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

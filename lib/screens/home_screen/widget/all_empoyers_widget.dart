// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/constants/colors.dart';
import 'package:flutter_bloc_example/mock/services_list.dart';
import 'package:flutter_bloc_example/screens/detail_screen/detail_screen.dart';
import 'package:flutter_bloc_example/screens/home_screen/bloc/services_by_category_bloc.dart';
import 'package:flutter_bloc_example/screens/home_screen/bloc/services_by_category_state.dart';
import 'package:flutter_bloc_example/screens/home_screen/widget/user_information_cart.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class AllEmployersListView extends StatefulWidget {
  const AllEmployersListView({super.key});

  @override
  State<AllEmployersListView> createState() => _AllEmployersListViewState();
}

class _AllEmployersListViewState extends State<AllEmployersListView> {
  final List<ServiceModel> _serviceList = ServiceModel.serviceList;
  late final Future<List<ServiceModel>> _fetchServices;

  Future<List<ServiceModel>> _getServicesList() async {
    await Future.delayed(const Duration(seconds: 3));
    return _serviceList;
  }

  @override
  void initState() {
    super.initState();
    _fetchServices = _getServicesList();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: FutureBuilder<List<ServiceModel>>(
        future: _fetchServices,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryDark,
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text("No data available"),
            );
          } else {
            return BlocBuilder<ServicesByCategoryBloc, ServicesByCategoryState>(
              builder: (context, state) {
                return ListView.builder(
                  itemCount: state.services!.isEmpty
                      ? snapshot.data!.length
                      : state.services!.length,
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final item = state.services!.isEmpty
                        ? snapshot.data?.elementAt(index)
                        : state.services!.elementAt(index);
                    return EmployerInformationCart(
                      imagePath: item?.image ?? "No information",
                      name: item?.name ?? "No information",
                      surname: item?.surname ?? "No information",
                      field: item?.field ?? "No information",
                      salary: item?.salary ?? "No information",
                      raking: item?.ratingRank ?? "No information",
                      onTap: () {
                        if (item != null && item.id != null) {
                          PersistentNavBarNavigator.pushNewScreen(
                            context,
                            screen: DetailScreen(id: item.id),
                            withNavBar: true,
                          );
                        }
                      },
                      onSaved: () {},
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}

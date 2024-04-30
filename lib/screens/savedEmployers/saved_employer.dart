import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/constants/colors.dart';
import 'package:flutter_bloc_example/constants/text_styles.dart';
import 'package:flutter_bloc_example/model/service_model.dart';
import 'package:flutter_bloc_example/screens/detail_screen/detail_screen.dart';
import 'package:flutter_bloc_example/screens/home_screen/widget/user_information_cart.dart';
import 'package:flutter_bloc_example/service/firbase_service.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class SavedEmployer extends StatefulWidget {
  const SavedEmployer({super.key});

  @override
  State<SavedEmployer> createState() => _SavedEmployerState();
}

class _SavedEmployerState extends State<SavedEmployer> {
  final IFirebaseService _service = FirebaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: SingleChildScrollView(
        child: StreamBuilder(
          stream: _service.getSavedServices(),
          builder: (context, AsyncSnapshot<List<ServiceModel>> snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: snapshot.data!.map((service) {
                  return EmployerInformationCart(
                    imagePath: service.image!,
                    name: service.name!,
                    surname: service.surname!,
                    field: service.field!,
                    salary: service.salary!,
                    raking: service.ratingRank!,
                    isSaved: service.isSaved,
                    onSaved: () async {
                      await _service.unsavedItem(service.id!);
                    },
                    onTap: () {
                      PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: DetailScreen(id: service.id),
                        withNavBar: true,
                      );
                    },
                  );
                }).toList(),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryDark,
                ),
              );
            }
          },
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: Text(
        "Saved Services",
        style: TextStyles.sameBold(
          color: AppColors.white,
          fontSize: 16,
        ),
      ),
    );
  }
}

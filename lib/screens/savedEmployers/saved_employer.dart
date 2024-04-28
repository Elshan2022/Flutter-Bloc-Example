import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/constants/colors.dart';
import 'package:flutter_bloc_example/constants/text_styles.dart';
import 'package:flutter_bloc_example/model/service_model.dart';
import 'package:flutter_bloc_example/screens/home_screen/widget/user_information_cart.dart';
import 'package:flutter_bloc_example/service/firbase_service.dart';

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
                    onTap: () {},
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

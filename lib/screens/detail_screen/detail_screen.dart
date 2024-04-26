// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/constants/colors.dart';
import 'package:flutter_bloc_example/constants/text_styles.dart';
import 'package:flutter_bloc_example/mock/services_list.dart';
import 'package:flutter_bloc_example/screens/detail_screen/widgets/about_widget.dart';
import 'package:flutter_bloc_example/screens/detail_screen/widgets/location_widget.dart';
import 'package:flutter_bloc_example/screens/detail_screen/widgets/message_book_widget.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, this.id});
  final String? id;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final List<ServiceModel> _serviceList = ServiceModel.serviceList;
  late final ServiceModel _service;

  _findItem() {
    final item = _serviceList.singleWhere((element) {
      return element.id == widget.id;
    });

    setState(() {
      _service = item;
    });
  }

  @override
  void initState() {
    super.initState();
    _findItem();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          _employerImage(context),
          Container(
            height: height * 0.8,
            margin: EdgeInsets.only(top: height * 0.4),
            decoration: _decoration(),
            child: Container(
              margin: const EdgeInsets.only(left: 16, right: 16, top: 20),
              child: SingleChildScrollView(
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _header(),
                        const SizedBox(height: 20),
                        _nameAndRank(),
                        const SizedBox(height: 20),
                        LocationWidget(serviceModel: _service),
                        const SizedBox(height: 15),
                        _salary(),
                        const SizedBox(height: 15),
                        const Divider(color: AppColors.grey),
                        const SizedBox(height: 15),
                        _aboutTitle(),
                        const SizedBox(height: 10),
                        AboutWidget(model: _service),
                        const SizedBox(height: 60),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          const MessageBook(),
        ],
      ),
    );
  }

  Text _aboutTitle() {
    return Text(
      "About me",
      style: TextStyles.bold(
        fontSize: 20,
        color: Colors.black,
      ),
    );
  }

  RichText _salary() {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "${_service.salary}\$",
            style: TextStyles.sameBold(
              fontSize: 18,
              color: AppColors.primaryDark,
            ),
          ),
          TextSpan(
            text: "(per day)",
            style: TextStyles.medium(
              color: AppColors.grey,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Row _nameAndRank() {
    return Row(
      children: [
        Text(
          "${_service.name} ${_service.surname}",
          style: TextStyles.sameBold(
            color: AppColors.primaryDark,
            fontSize: 16,
          ),
        ),
        const SizedBox(width: 15),
        const Icon(
          Icons.star,
          color: Colors.red,
        ),
        const SizedBox(width: 10),
        Text(
          "${_service.ratingRank}",
          style: TextStyles.sameBold(
            color: AppColors.primaryDark,
            fontSize: 16,
          ),
        )
      ],
    );
  }

  Row _header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          _service.field.toString(),
          style: TextStyles.bold(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        SizedBox(
          child: Row(
            children: [
              InkWell(
                onTap: () {},
                child: const Icon(Icons.share),
              ),
              const SizedBox(width: 10),
              InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.bookmark,
                  color: AppColors.primaryDark,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  BoxDecoration _decoration() {
    return const BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(25),
      ),
    );
  }

  Stack _employerImage(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 350,
          child: Image.network(
            _service.image.toString(),
            fit: BoxFit.cover,
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            height: 30,
            width: 30,
            margin: const EdgeInsets.only(left: 25, top: 30),
            padding: const EdgeInsets.all(5),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.grey,
            ),
            child: const Center(
              child: Icon(Icons.arrow_back_ios, color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}

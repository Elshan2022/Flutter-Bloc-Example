// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/common/helper_functions.dart';
import 'package:flutter_bloc_example/constants/colors.dart';
import 'package:flutter_bloc_example/constants/text_styles.dart';
import 'package:flutter_bloc_example/mock/services_list.dart';
import 'package:flutter_bloc_example/screens/detail_screen/bloc/location_bloc.dart';
import 'package:flutter_bloc_example/screens/detail_screen/bloc/location_event.dart';
import 'package:flutter_bloc_example/screens/detail_screen/bloc/location_state.dart';
import 'package:flutter_bloc_example/service/location_service.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen({super.key, this.index});
  final int? index;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final List<ServiceModel> _serviceList = ServiceModel.serviceList;
  final LocationService _locationService = LocationService();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  _getLocation() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final item = _serviceList[widget.index!];
      final address =
          await _locationService.getLocation(item.latitude, item.longitude);
      debugPrint("Address $address");
      context.read<LocationBloc>().add(CoordinatesEvent(location: address));
    } catch (e) {
      debugPrint("Exception $e");
      HelperFunctions.showCustomSnackBar(context, e.toString(), Colors.red);
    }
    setState(() {
      _isLoading = false;
    });
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
              child: Stack(
                children: [
                  Column(
                    children: [
                      _header(),
                      const SizedBox(height: 20),
                      _nameAndRank(),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: AppColors.primaryDark,
                          ),
                          const SizedBox(width: 15),
                          BlocBuilder<LocationBloc, LocationState>(
                            builder: (context, state) {
                              return Text(
                                /* _isLoading
                                    ? "Address getting..."
                                    : state.location! */
                                "New York",
                                style: TextStyles.medium(
                                  fontSize: 18,
                                  color: AppColors.grey,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
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
          "${_serviceList[widget.index!].name} ${_serviceList[widget.index!].surname}",
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
          "${_serviceList[widget.index!].ratingRank}",
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
          _serviceList[widget.index!].field.toString(),
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
            _serviceList[widget.index!].image.toString(),
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

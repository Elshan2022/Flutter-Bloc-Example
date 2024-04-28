import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/constants/colors.dart';
import 'package:flutter_bloc_example/constants/text_styles.dart';
import 'package:flutter_bloc_example/model/service_model.dart';
import 'package:flutter_bloc_example/service/location_service.dart';

class LocationWidget extends StatefulWidget {
  const LocationWidget({super.key, required this.serviceModel});
  final ServiceModel serviceModel;

  @override
  State<LocationWidget> createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationWidget> {
  final LocationService _locationService = LocationService();
  String? address;

  _fetchAddress() async {
    final location = await _locationService.getLocation(
      widget.serviceModel.latitude,
      widget.serviceModel.longitude,
    );
    setState(() {
      address = location;
    });
  }

  @override
  void initState() {
    _fetchAddress();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        const Icon(
          Icons.location_on,
          color: AppColors.primaryDark,
        ),
        const SizedBox(width: 15),
        SizedBox(
          width: width - 80,
          child: Text(
            address == null ? "Address getting" : "$address",
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyles.medium(
              fontSize: 16,
              color: AppColors.grey,
            ),
          ),
        ),
      ],
    );
  }
}

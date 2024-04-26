import 'package:flutter/material.dart';
import 'package:geocode/geocode.dart';

class LocationService {
  final GeoCode _geoCode = GeoCode();
  Future<String?> getLocation(String? lat, String? long) async {
    try {
      final latitude = double.parse(lat!);
      final longitude = double.parse(long!);
      debugPrint("Latitude $latitude");
      debugPrint("Longitude $longitude");

      final address = await _geoCode.reverseGeocoding(
          latitude: latitude, longitude: longitude);
      final country = address.countryName;
      final street = address.streetAddress;
      final streetNumber = address.streetNumber;
      return "$country,$streetNumber $street";
    } catch (e) {
      debugPrint("Error Occur $e");
    }
    return null;
  }
}

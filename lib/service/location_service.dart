import 'package:geocoding/geocoding.dart';

class LocationService {
  Future<String?> getLocation(String? lat, String? long) async {
    if (lat != null && long != null) {
      try {
        final latitude = double.parse(lat);
        final longitude = double.parse(long);

        final List<Placemark> placeMarks =
            await placemarkFromCoordinates(latitude, longitude);
        final country = placeMarks[0].country;
        final street = placeMarks[0].street;
        return "$country, $street";
      } catch (e) {
        throw Exception(e);
      }
    }
    return null;
  }
}

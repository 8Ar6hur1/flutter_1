import 'package:geolocator/geolocator.dart';

class LocationPermissionDatasource {

  Future<bool> checkLocationPermission() async {
    var permission = await Geolocator.checkPermission();
    return permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse;
  }
}

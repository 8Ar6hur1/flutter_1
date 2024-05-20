import 'package:permission_handler/permission_handler.dart';

class LocationPermissionUseCase {
  Future<PermissionStatus> requestLocationPermission() async {
    return Permission.location.request();
  }
}
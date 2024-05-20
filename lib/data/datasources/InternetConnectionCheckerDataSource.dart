import 'package:connectivity_plus/connectivity_plus.dart';

class InternetConnectCheckerDataSource {
  final Connectivity _connectivity;

  InternetConnectCheckerDataSource(this._connectivity);

  Future<bool> isInternetAvailable() async {
    final connectivityResult = await _connectivity.checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }
}

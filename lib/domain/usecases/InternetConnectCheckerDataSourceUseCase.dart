import 'package:connectivity_plus/connectivity_plus.dart';

class InternetConnectCheckerDataSourceUseCase {
  final Connectivity _connectivity;

  InternetConnectCheckerDataSourceUseCase(this._connectivity);

  Future<bool> isInternetAvailable() async {
    final connectivityResult = await _connectivity.checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }
}

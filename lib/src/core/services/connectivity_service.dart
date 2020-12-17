import 'package:connectivity/connectivity.dart';
import 'package:movie_app/src/core/services/i_connectivity_service.dart';

class ConnectivityService implements IConnectivitySevice {
  ConnectivityService();

  Connectivity connectivity = Connectivity();

  @override
  Future<bool> isConnected() async {
    final connectivityResult = await connectivity.checkConnectivity();
    return connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi;
  }
}

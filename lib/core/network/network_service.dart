import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:rokus/config/constants/constants.dart';
import 'package:rokus/core/snackbar/show_message.dart';
// import 'package:get_it/get_it.dart';

// final sl = GetIt.instance;

class NetworkService {
  Connectivity connectivity = Connectivity();
  Dio http = Dio();

  NetworkService() {
    initHeaders();
  }

  initHeaders() {
    http.options.headers = {
      "locale": "tk",
    };
    http.options.baseUrl = baseUrl;
  }

  Future<bool> isConnected({showMessage = true}) async {
    final result = await connectivity.checkConnectivity();
    if (result != ConnectivityResult.none) {
      return true;
    }
    showSnackMessage(
      "No internet",
      messageType: MessageType.error,
    );
    return false;
  }
}

// setup() {
//   var net = NetworkService();
//   net.initHeaders();

//   Get.put<NetworkService>(net);

//   NetworkService networkService = Get.find<NetworkService>();
//   networkService.http.get('path');
// }

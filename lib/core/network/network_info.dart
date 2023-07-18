// // For checking internet connectivity
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:get/get.dart';

// class NetworkInfo {
//   Connectivity connectivity = Connectivity();

//   Future<bool> isConnected({showMessage = true}) async {
//     final result = await connectivity.checkConnectivity();
//     if (result != ConnectivityResult.none) {
//       return true;
//     }
//     Get.snackbar(
//       'No internet',
//       'Please check connection, and try again!',
//       snackPosition: SnackPosition.BOTTOM,
//     );
//     return false;
//   }

//   Future<ConnectivityResult> get connectivityResult async {
//     return connectivity.checkConnectivity();
//   }

//   Stream<ConnectivityResult> get onConnectivityChanged =>
//       connectivity.onConnectivityChanged;
// }

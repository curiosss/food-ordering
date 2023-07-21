import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:rokus/core/network/data_state.dart';
import 'package:rokus/core/network/network_service.dart';
import 'package:rokus/core/snackbar/show_message.dart';
import 'package:rokus/features/auth/domain/entities/user.dart';
import 'package:rokus/features/auth/domain/repositories/auth_repo.dart';

import '../domain/entities/role.dart';

class AuthRepoImpl implements AuthRepo {
  late NetworkService networkService;

  AuthRepoImpl() {
    networkService = Get.find<NetworkService>();
  }

  @override
  Future<(User?, ResponseStatus)> login({
    required Role role,
    required String phone,
    required String password,
    String? key,
  }) async {
    try {
      if (!await networkService.isConnected()) {
        return (null, ResponseStatus.noInternet);
      }
      var response =
          await networkService.http.post('/public/user/login', data: {
        "phone": "993$phone",
        "password": password,
      });

      if (response.statusCode == 200 && response.data["data"] != null) {
        User user = User.fromMap(response.data['data']);
        // print(user);
        return (user, ResponseStatus.success);
      }
      Get.snackbar(
        'No internet',
        'Please check connection, and try again!',
        snackPosition: SnackPosition.BOTTOM,
      );
    } on DioException catch (e) {
      log(e.toString());
      // Get.snackbar(
      //   'No internet',
      //   'Please check connection, and try again!',
      //   snackPosition: SnackPosition.BOTTOM,
      // );
      showSnackMessage(
        e.response?.data.toString() ?? "custom error",
        messageType: MessageType.error,
      );

      return (null, ResponseStatus.error);
    }
    return (null, ResponseStatus.error);
  }
}

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:rokus/core/error/network_error.dart';
import 'package:rokus/core/network/network_service.dart';
import 'package:rokus/core/snackbar/show_message.dart';
import 'package:rokus/features/auth/domain/entities/user.dart';
import 'package:rokus/features/auth/domain/repositories/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  late NetworkService networkService;

  AuthRepoImpl() {
    networkService = Get.find<NetworkService>();
  }

  @override
  Future<User?> login({
    required String phone,
    required String password,
  }) async {
    try {
      if (!await networkService.isConnected()) {
        return null;
      }
      var response =
          await networkService.http.post('/public/user/login', data: {
        "phone": "993$phone",
        "password": password,
      });

      if (response.statusCode == 200 && response.data["data"] != null) {
        User user = User.fromMap(response.data['data']);
        // print(user);
        return user;
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
        e.response?.data["message"] ?? "custom error",
        messageType: MessageType.error,
      );

      return null;
    }
    return null;
  }

  @override
  Future<User?> signUp({required Map<String, dynamic> data}) async {
    try {
      if (!await networkService.isConnected()) {
        return (null);
      }
      var response =
          await networkService.http.post('/public/user/sign-up', data: data);

      if (response.statusCode == 200 && response.data["data"] != null) {
        User user = User.fromMap(response.data['data']);
        return user;
      }
    } on DioException catch (e) {
      log(e.toString());
      showErrorMessageFromRes(e.response);
      return null;
    }
    return null;
  }
}

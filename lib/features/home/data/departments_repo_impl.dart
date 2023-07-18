import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:rokus/core/network/data_state.dart';
import 'package:rokus/core/network/network_service.dart';
import 'package:rokus/features/home/domain/entities/department_model.dart';
import 'package:rokus/features/home/domain/repositories/departments_repo.dart';

class DepartmentsRepoImpl implements DepartmentsRepo {
  late NetworkService networkService;

  DepartmentsRepoImpl() {
    networkService = Get.find<NetworkService>();
  }

  @override
  Future<(List<Department>?, ResponseStatus)> getAllDepartments() async {
    try {
      if (!await networkService.isConnected()) {
        return (null, ResponseStatus.noInternet);
      }
      var response = await networkService.http.get('/public/departments');

      if (response.statusCode == 200 && response.data["data"] != null) {
        if (response.data["data"]["departments"] != null) {
          List<Department> departments = List<Department>.from(response
              .data["data"]["departments"]
              .map((e) => Department.fromMap(e))
              .toList());
          return (departments, ResponseStatus.success);
        }
      }
    } on DioException catch (e) {
      log(e.toString());
      return (null, ResponseStatus.error);
    }
    return (null, ResponseStatus.error);
  }
}

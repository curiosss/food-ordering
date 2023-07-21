import 'package:get/get.dart';
import 'package:rokus/features/home/data/departments_repo_impl.dart';

import 'package:rokus/features/home/domain/entities/department_model.dart';

class HomePageCtrl {
  DepartmentsRepoImpl departmentsRepo = DepartmentsRepoImpl();

  RxBool isloading = false.obs;

  List<Department> departments = [];

  HomePageCtrl() {
    fetchDepartments();
  }

  fetchDepartments() async {
    isloading.value = true;

    final (data, _) = await departmentsRepo.getAllDepartments();
    if (data != null) {
      departments = data;
    }

    isloading.value = false;
  }
}

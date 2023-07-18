import 'package:rokus/core/network/data_state.dart';
import 'package:rokus/features/home/domain/entities/department_model.dart';

abstract class DepartmentsRepo {
  Future<(List<Department>?, ResponseStatus)> getAllDepartments();
}

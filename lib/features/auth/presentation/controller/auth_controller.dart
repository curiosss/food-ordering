import 'package:get/get.dart';
import 'package:rokus/features/auth/data/auth_repo_impl.dart';
import 'package:rokus/features/auth/domain/entities/role.dart';

class AuthController {
  AuthController() {
    init();
  }

  init() {
    selectedRole = roles.first.obs;
  }

  AuthRepoImpl authRepoImpl = AuthRepoImpl();

  final List<Role> roles = [
    Role(
      id: 1,
      slug: "user",
      name: "User",
    ),
    Role(
      id: 2,
      slug: "resAdmin",
      name: "Restaurant admin",
    ),
    Role(
      id: 3,
      slug: "resOperator",
      name: "Restaurant operator",
    ),
  ];
  Rx<Role>? selectedRole;

  login({
    required Role role,
    required String phone,
    required String password,
    String? key,
  }) async {
    await authRepoImpl.login(
      role: role,
      phone: phone,
      password: password,
    );
  }
}

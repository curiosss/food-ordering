import 'package:get/get.dart';
import 'package:rokus/features/auth/domain/entities/role.dart';

class AuthController {
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
  RxInt selectedRoleId = 1.obs;
}

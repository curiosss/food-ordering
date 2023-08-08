import 'package:get/get.dart';
import 'package:rokus/core/settings/app_settings.dart';
import 'package:rokus/features/auth/data/auth_repo_impl.dart';
import 'package:rokus/features/auth/domain/entities/role.dart';
import 'package:rokus/features/auth/domain/entities/user.dart';

class AuthController {
  AuthController() {
    init();
  }

  init() {
    selectedRole = roles.first.obs;
    String? userStr = AppSettings.box?.get('user');
    if (userStr != null) {
      user.value = User.fromJson(userStr);
    }
  }

  Rx<User?> user = Rx(null);

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

  Future<bool> login({
    required String phone,
    required String password,
  }) async {
    User? user = await authRepoImpl.login(
      phone: phone,
      password: password,
    );
    if (user != null) {
      saveUser(user);
      return true;
    }
    return false;
  }

  logout() {
    user.value = null;
    AppSettings.box?.delete('user');
  }

  signUp({
    required Map<String, dynamic> data,
  }) async {
    await authRepoImpl.signUp(data: data);
  }

  saveUser(User userMd) {
    user.value = userMd;
    AppSettings.box?.put('user', userMd.toJson());
  }

  String getUserNameLetters() {
    String ss = '';
    if (user.value != null) {
      if (user.value!.name.isNotEmpty) {
        ss = user.value!.name[0].toUpperCase();
      }
      if (user.value!.surname.isNotEmpty) {
        ss += user.value!.surname[0].toUpperCase();
      }
    }
    return ss;
  }
}

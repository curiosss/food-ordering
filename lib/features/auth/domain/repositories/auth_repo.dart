import 'package:rokus/core/network/data_state.dart';
import 'package:rokus/features/auth/domain/entities/user.dart';

import '../entities/role.dart';

abstract class AuthRepo {
  Future<(User?, ResponseStatus)> login({
    required Role role,
    required String phone,
    required String password,
    String? key,
  });
}

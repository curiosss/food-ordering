import 'package:rokus/features/auth/domain/entities/user.dart';

abstract class AuthRepo {
  Future<User?> login({
    required String phone,
    required String password,
  });

  Future<User?> signUp({required Map<String, dynamic> data});
}

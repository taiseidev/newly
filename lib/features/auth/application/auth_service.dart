import 'package:nost/core/utils/logger.dart';
import 'package:nost/exceptions/app_exception.dart';
import 'package:nost/features/auth/domain/repositories/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_service.g.dart';

@Riverpod(keepAlive: true)
AuthService authService(AuthServiceRef ref) =>
    AuthService(ref.watch(authRepositoryProvider));

class AuthService {
  const AuthService(this.repository);

  final AuthRepository repository;

  Future<void> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      await repository.signInWithEmail(email: email, password: password);
    } on Exception catch (e) {
      logger.e(e);
      throw AppException.general(e);
    }
  }

  Future<void> signUpWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      await repository.signUpWithEmail(email: email, password: password);
    } on Exception catch (e) {
      logger.e(e);
      throw AppException.general(e);
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      await repository.signInWithGoogle();
    } on Exception catch (e) {
      logger.e(e);
      throw AppException.general(e);
    }
  }

  Future<void> signOut() async {
    try {
      await repository.signOut();
    } on Exception catch (e) {
      logger.e(e);
      throw AppException.general(e);
    }
  }
}

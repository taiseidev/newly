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

  Future<void> signOut() async {
    try {
      await repository.signOut();
    } on Exception catch (e) {
      throw AppException.error(e.toString());
    }
  }
}

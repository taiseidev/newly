import 'package:nost/features/auth/domain/repositories/auth_repository.dart';
import 'package:nost/main.dart';

class MockAuthRepository extends AuthRepository {
  MockAuthRepository();

  @override
  Future<void> signInWithEmail({
    required String email,
    required String password,
  }) async {}

  @override
  Future<void> signInWithGoogle() async {}

  @override
  Future<void> signInWithApple() async {}

  @override
  Future<void> signOut() async {
    // 不正なクエリを実行
    await supabase.from('non_existing_table').select();
  }

  @override
  Future<void> signUpWithEmail({
    required String email,
    required String password,
  }) {
    // TODO: implement signUpWithEmail
    throw UnimplementedError();
  }
}

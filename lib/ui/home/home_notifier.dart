import 'package:nost/features/auth/application/auth_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_notifier.g.dart';

@riverpod
class HomeNotifier extends _$HomeNotifier {
  @override
  FutureOr<void> build() async => null;

  Future<void> signInWithEmail({
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      await ref.read(authServiceProvider).signInWithEmail(
            email: email,
            password: password,
          );
    });
  }

  // 仮で作成
  Future<void> signOut() async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      await ref.read(authServiceProvider).signOut();
    });
  }
}

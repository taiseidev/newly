import 'package:nost/features/activities/application/activity_service.dart';
import 'package:nost/features/auth/application/auth_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'scaffold_with_nav_bar_notifier.g.dart';

@riverpod
final class ScaffoldWithNavBarNotifier extends _$ScaffoldWithNavBarNotifier {
  @override
  FutureOr<void> build() async => null;

  Future<void> createActivity({
    required String title,
    required String description,
  }) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      await ref.read(activityServiceProvider).create(
            title: title,
            description: description,
          );
    });
  }

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
}

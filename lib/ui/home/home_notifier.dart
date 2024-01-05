import 'package:nost/features/activities/application/activity_service.dart';
import 'package:nost/features/activities/domain/activity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_notifier.g.dart';

@riverpod
class HomeNotifier extends _$HomeNotifier {
  @override
  Future<List<Activity>> build() async {
    final activities = ref.read(activityServiceProvider).fetchAll();
    return activities;
  }

  Future<void> addActivity({
    required String title,
    required String description,
  }) async {
    state = const AsyncLoading();
    await AsyncValue.guard(
      () async => ref.read(activityServiceProvider).create(
            title: title,
            description: description,
          ),
    );
    ref.invalidateSelf();
  }

  Future<void> updateActivity({
    required Activity activity,
    String? title,
    String? description,
  }) async {
    state = const AsyncLoading();
    await AsyncValue.guard(
      () async => ref.read(activityServiceProvider).update(
            currentActivity: activity,
            newTitle: title,
            newDescription: description,
          ),
    );
    ref.invalidateSelf();
  }

  Future<void> deleteActivity(String activityId) async {
    state = const AsyncLoading();
    await AsyncValue.guard(
      () async => ref.read(activityServiceProvider).delete(activityId),
    );
    ref.invalidateSelf();
  }
}

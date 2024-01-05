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
}

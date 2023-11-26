import 'package:nost/features/activities/domain/activity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'activity_repository.g.dart';

@Riverpod(keepAlive: true)
ActivityRepository activityRepository(ActivityRepositoryRef ref) =>
    throw UnimplementedError();

abstract class ActivityRepository {
  Future<void> insert(Activity activity);
  Future<List<Activity>> fetchAll();
}

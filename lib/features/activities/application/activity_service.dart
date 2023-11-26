import 'package:nost/features/activities/domain/activity.dart';
import 'package:nost/features/activities/domain/repositories/activity_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'activity_service.g.dart';

@Riverpod(keepAlive: true)
ActivityService activityService(ActivityServiceRef ref) =>
    ActivityService(ref.watch(activityRepositoryProvider));

class ActivityService {
  const ActivityService(this.repository);

  final ActivityRepository repository;

  Future<List<Activity>> fetchAll() async {
    final result = await repository.fetchAll();
    return result;
  }
}

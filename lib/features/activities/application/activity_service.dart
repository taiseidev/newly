import 'package:nost/core/utils/logger.dart';
import 'package:nost/core/utils/uuid_generator.dart';
import 'package:nost/exceptions/app_exception.dart';
import 'package:nost/features/activities/domain/activity.dart';
import 'package:nost/features/activities/domain/repositories/activity_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'activity_service.g.dart';

@Riverpod(keepAlive: true)
ActivityService activityService(ActivityServiceRef ref) =>
    ActivityService(ref.watch(activityRepositoryProvider));

final class ActivityService {
  const ActivityService(this.repository);

  final ActivityRepository repository;

  Future<void> create({
    required String title,
    required String description,
  }) async {
    final activityId = UuidGenerator.create();
    final createdAt = DateTime.now().toIso8601String();

    final activity = Activity(
      activityId: activityId,
      title: title,
      description: description,
      imageUrl:
          'https://images.unsplash.com/photo-1588361861040-ac9b1018f6d5?q=80&w=3200&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      createdAt: createdAt,
    );

    try {
      await repository.insert(activity);
    } on Exception catch (e) {
      logger.e(e);
      throw AppException.general(e);
    }
  }

  Future<List<Activity>> fetchAll() async {
    late List<Activity> activities;
    try {
      activities = await repository.fetchAll();
    } on Exception catch (e) {
      logger.e(e);
      throw AppException.general(e);
    }
    return activities;
  }
}

import 'dart:io';

import 'package:nost/features/activities/domain/activity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'activity_repository.g.dart';

@Riverpod(keepAlive: true)
ActivityRepository activityRepository(ActivityRepositoryRef ref) =>
    throw UnimplementedError();

abstract class ActivityRepository {
  Future<void> insert(Activity activity);
  Future<List<Activity>> fetchAll();
  Future<void> update({
    required Activity newActivity,
  });
  Future<void> delete(String activityId);
  Future<void> uploadImages({
    required String activityId,
    required List<File> files,
  });
  Future<List<String>> fetchImages({
    required String activityId,
    required List<String> paths,
  });
}

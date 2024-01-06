import 'dart:io';

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
    List<File>? files,
  }) async {
    final activityId = UuidGenerator.create();
    final now = DateTime.now();

    List<String>? urls;

    if (files != null) {
      // 画像保存処理
      await _uploadImages(
        activityId: activityId,
        files: files,
      );

      // リモートに保存した画像をurlを一覧で取得
      urls = await _fetchImages(
        activityId: activityId,
        paths: files.map((file) => file.path).toList(),
      );
    }

    final activity = Activity(
      activityId: activityId,
      title: title,
      description: description,
      imageUrls: urls,
      createdAt: now,
      updatedAt: now,
    );

    try {
      await repository.insert(activity);
    } on Exception catch (e) {
      logger.e(e);
      throw AppException.general(e);
    }
  }

  Future<void> update({
    required Activity currentActivity,
    String? newTitle,
    String? newDescription,
  }) async {
    var newActivity = currentActivity;

    if (newTitle != null) {
      newActivity = newActivity.copyWith(title: newTitle);
    }

    if (newDescription != null) {
      newActivity = newActivity.copyWith(description: newDescription);
    }

    try {
      await repository.update(
        newActivity: newActivity,
      );
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

  Future<void> delete(String activityId) async {
    try {
      await repository.delete(activityId);
    } on Exception catch (e) {
      logger.e(e);
      throw AppException.general(e);
    }
  }

  Future<void> _uploadImages({
    required String activityId,
    required List<File> files,
  }) async {
    try {
      await repository.uploadImages(
        activityId: activityId,
        files: files,
      );
    } on Exception catch (e) {
      logger.e(e);
      throw AppException.general(e);
    }
  }

  Future<List<String>> _fetchImages({
    required String activityId,
    required List<String> paths,
  }) async {
    late List<String> urls;
    try {
      urls = await repository.fetchImages(
        activityId: activityId,
        paths: paths,
      );
    } on Exception catch (e) {
      logger.e(e);
      throw AppException.general(e);
    }
    return urls;
  }
}

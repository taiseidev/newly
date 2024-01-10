import 'dart:io';

import 'package:nost/features/activities/application/activity_service.dart';
import 'package:nost/features/tags/application/tag_service.dart';
import 'package:nost/features/tags/domain/tag.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'activity_facade.g.dart';

@Riverpod(keepAlive: true)
ActivityFacade activityFacade(ActivityFacadeRef ref) => ActivityFacade(
      activityService: ref.watch(activityServiceProvider),
      tagService: ref.watch(tagServiceProvider),
    );

final class ActivityFacade {
  const ActivityFacade({
    required this.activityService,
    required this.tagService,
  });

  final ActivityService activityService;
  final TagService tagService;

  Future<void> create({
    required String activityTitle,
    required String activityDescription,
    required List<Tag> tags,
    List<File>? files,
  }) async {
    await activityService.create(
      title: activityTitle,
      description: activityDescription,
      files: files,
    );

    await tagService.create(tags: tags);
  }
}

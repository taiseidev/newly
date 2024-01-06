import 'dart:io';

import 'package:nost/features/activities/domain/activity.dart';
import 'package:nost/features/activities/domain/repositories/activity_repository.dart';
import 'package:nost/main.dart';

final class SupabaseActivityRepository extends ActivityRepository {
  SupabaseActivityRepository();

  static const _tableName = 'activities';
  static const _userId = 'user_id';
  static const _activityId = 'activity_id';

  @override
  Future<void> insert(Activity activity) async {
    final userId = supabase.auth.currentUser?.id;
    await supabase.from(_tableName).insert(activity.copyWith(userId: userId));
  }

  @override
  Future<List<Activity>> fetchAll() async {
    // ここでAPIを叩く場合はcurrentUserがnullではないことは確実なので、いちいちnullチェックしないように修正する。
    final userId = supabase.auth.currentUser?.id;

    final result =
        await supabase.from(_tableName).select().eq(_userId, userId!);

    return result.map(Activity.fromJson).toList();
  }

  @override
  Future<void> update({
    required Activity newActivity,
  }) async {
    await supabase.from(_tableName).update(newActivity.toJson()).match(
      {_activityId: newActivity.activityId},
    );
  }

  @override
  Future<void> delete(String activityId) async {
    await supabase.from(_tableName).delete().match({_activityId: activityId});
  }

  @override
  Future<void> uploadImages({
    required String activityId,
    required List<File> files,
  }) async {
    final userId = supabase.auth.currentUser?.id;

    final chunk = <Future<void>>[];
    for (final file in files) {
      final filePath = '$userId/$activityId/${file.path}';
      final future = supabase.storage.from('activity').upload(filePath, file);
      chunk.add(future);
    }

    await Future.wait(chunk);
  }

  @override
  Future<List<String>> fetchImages({
    required String activityId,
    required List<String> paths,
  }) async {
    final userId = supabase.auth.currentUser?.id;

    final urls = <String>[];
    for (final path in paths) {
      final filePath = '$userId/$activityId/$path';
      final url = supabase.storage.from('activity').getPublicUrl(filePath);
      urls.add(url);
    }

    return urls;
  }
}

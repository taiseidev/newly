import 'package:nost/features/activities/domain/activity.dart';
import 'package:nost/features/activities/domain/repositories/activity_repository.dart';
import 'package:nost/main.dart';

final class SupabaseActivityRepository extends ActivityRepository {
  SupabaseActivityRepository();

  static const _tableName = 'activities';

  @override
  Future<void> insert(Activity activity) async {
    final userId = supabase.auth.currentUser?.id;
    await supabase.from(_tableName).insert(activity.copyWith(userId: userId));
  }

  @override
  Future<List<Activity>> fetchAll() async {
    // ここでAPIを叩く場合はcurrentUserがnullではないことは確実なので、いちいちnullチェックしないように修正する。
    final userId = supabase.auth.currentUser?.id;

    print(userId);

    if (userId != null) {}
    final result = await supabase
        .from(_tableName)
        .select<List<Map<String, dynamic>>>()
        .eq('user_id', userId);
    return result.map(Activity.fromJson).toList();
  }
}

import 'package:nost/features/activities/domain/activity.dart';
import 'package:nost/features/activities/domain/repositories/activity_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseActivityRepository extends ActivityRepository {
  SupabaseActivityRepository({required this.supabase});

  final SupabaseClient supabase;

  @override
  Future<void> insert(Activity activity) async {
    await supabase.from('activities').insert(activity);
  }
}

import 'package:nost/features/tags/domain/repository/tag_repository.dart';
import 'package:nost/features/tags/domain/tag.dart';
import 'package:nost/main.dart';

final class SupabaseTagRepository extends TagRepository {
  static const _tableName = 'tags';
  static const _name = 'name';

  @override
  Future<void> create(Tag tag) async {
    final userId = supabase.auth.currentUser?.id;
    await supabase.from(_tableName).insert(tag.copyWith(userId: userId));
  }

  @override
  Future<bool> isExist(String tagName) async {
    final response =
        await supabase.from(_tableName).select().eq(_name, tagName);
    return response.isNotEmpty;
  }

  @override
  Future<void> createUserRelation(String tagId) async {
    final userId = supabase.auth.currentUser?.id;
    // FIXME: 下記中間テーブル作成の処理が走っていないので調査
    await supabase.rpc<void>(
      'add_user_tag',
      params: {
        'id': tagId,
        'user_id': userId,
      },
    );
  }
}

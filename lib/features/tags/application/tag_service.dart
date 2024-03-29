import 'package:nost/core/utils/logger.dart';
import 'package:nost/core/utils/uuid_generator.dart';
import 'package:nost/exceptions/app_exception.dart';
import 'package:nost/features/tags/domain/repository/tag_repository.dart';
import 'package:nost/features/tags/domain/tag.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tag_service.g.dart';

@Riverpod(keepAlive: true)
TagService tagService(TagServiceRef ref) =>
    TagService(ref.watch(tagRepositoryProvider));

final class TagService {
  const TagService(this.repository);

  final TagRepository repository;

  Future<void> create({
    required List<Tag> tags,
  }) async {
    final futures = tags.map(_processChunk).toList();

    await Future.wait(futures);
  }

  Future<void> _processChunk(
    Tag tag,
  ) async {
    final tagId = UuidGenerator.create();
    final isExist = await _checkTagExists(tag.name);

    if (isExist) {
      // タグがすでに存在する場合は中間テーブル作成のみ
      await repository.createUserRelation(tagId);
      return;
    }
    // tagsテーブルに追加されるたびにsupabase側で中間テーブルを作成するので、
    // クライアント側では中間テーブルを作成しない。
    await _insert(
      tagId: tagId,
      tagName: tag.name,
      isPrivate: tag.isPrivate,
    );
  }

  // タグを追加する処理
  Future<void> _insert({
    required String tagId,
    required String tagName,
    required bool isPrivate,
  }) async {
    final now = DateTime.now();

    final tag = Tag(
      id: tagId,
      name: tagName,
      createdAt: now,
      isPrivate: isPrivate,
    );

    try {
      await repository.create(tag);
    } on Exception catch (e) {
      logger.e(e);
      throw AppException.general(e);
    }
  }

  // タグが存在するかのチェック
  Future<bool> _checkTagExists(String tagName) async {
    late bool isExist;
    try {
      isExist = await repository.isExist(tagName);
    } on Exception catch (e) {
      logger.e(e);
      throw AppException.general(e);
    }
    return isExist;
  }
}

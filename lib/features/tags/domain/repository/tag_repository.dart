import 'package:nost/features/tags/domain/tag.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tag_repository.g.dart';

@Riverpod(keepAlive: true)
TagRepository tagRepository(TagRepositoryRef ref) => throw UnimplementedError();

abstract class TagRepository {
  Future<void> create(Tag tag);
  Future<bool> isExist(String tagName);
  Future<void> createUserRelation(String tagId);
}

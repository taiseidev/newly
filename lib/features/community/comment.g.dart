// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommentImpl _$$CommentImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$CommentImpl',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const [
            'comment_id',
            'post_id',
            'user_id',
            'comment_date',
            'comment'
          ],
        );
        final val = _$CommentImpl(
          commentId: $checkedConvert('comment_id', (v) => v as int?),
          postId: $checkedConvert('post_id', (v) => v as int?),
          userId: $checkedConvert('user_id', (v) => v as int?),
          commentDate: $checkedConvert('comment_date', (v) => v as String?),
          comment: $checkedConvert('comment', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'commentId': 'comment_id',
        'postId': 'post_id',
        'userId': 'user_id',
        'commentDate': 'comment_date'
      },
    );

Map<String, dynamic> _$$CommentImplToJson(_$CommentImpl instance) =>
    <String, dynamic>{
      'comment_id': instance.commentId,
      'post_id': instance.postId,
      'user_id': instance.userId,
      'comment_date': instance.commentDate,
      'comment': instance.comment,
    };

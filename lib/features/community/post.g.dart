// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostImpl _$$PostImplFromJson(Map<String, dynamic> json) => $checkedCreate(
      r'_$PostImpl',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const [
            'post_id',
            'user_id',
            'activity_id',
            'post_date',
            'content'
          ],
        );
        final val = _$PostImpl(
          postId: $checkedConvert('post_id', (v) => v as int?),
          userId: $checkedConvert('user_id', (v) => v as int?),
          activityId: $checkedConvert('activity_id', (v) => v as int?),
          postDate: $checkedConvert('post_date', (v) => v as String?),
          content: $checkedConvert('content', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'postId': 'post_id',
        'userId': 'user_id',
        'activityId': 'activity_id',
        'postDate': 'post_date'
      },
    );

Map<String, dynamic> _$$PostImplToJson(_$PostImpl instance) =>
    <String, dynamic>{
      'post_id': instance.postId,
      'user_id': instance.userId,
      'activity_id': instance.activityId,
      'post_date': instance.postDate,
      'content': instance.content,
    };

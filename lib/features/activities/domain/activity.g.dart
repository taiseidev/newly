// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ActivityImpl _$$ActivityImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$ActivityImpl',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const [
            'activity_id',
            'user_id',
            'title',
            'description',
            'image_url',
            'created_at'
          ],
        );
        final val = _$ActivityImpl(
          activityId: $checkedConvert('activity_id', (v) => v as String),
          userId: $checkedConvert('user_id', (v) => v as String?),
          title: $checkedConvert('title', (v) => v as String?),
          description: $checkedConvert('description', (v) => v as String?),
          imageUrl: $checkedConvert('image_url', (v) => v as String?),
          createdAt: $checkedConvert('created_at', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'activityId': 'activity_id',
        'userId': 'user_id',
        'imageUrl': 'image_url',
        'createdAt': 'created_at'
      },
    );

Map<String, dynamic> _$$ActivityImplToJson(_$ActivityImpl instance) =>
    <String, dynamic>{
      'activity_id': instance.activityId,
      'user_id': instance.userId,
      'title': instance.title,
      'description': instance.description,
      'image_url': instance.imageUrl,
      'created_at': instance.createdAt,
    };

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
            'created_at',
            'updated_at',
            'user_id',
            'title',
            'description',
            'image_urls'
          ],
        );
        final val = _$ActivityImpl(
          activityId: $checkedConvert('activity_id', (v) => v as String),
          createdAt:
              $checkedConvert('created_at', (v) => DateTime.parse(v as String)),
          updatedAt:
              $checkedConvert('updated_at', (v) => DateTime.parse(v as String)),
          userId: $checkedConvert('user_id', (v) => v as String?),
          title: $checkedConvert('title', (v) => v as String?),
          description: $checkedConvert('description', (v) => v as String?),
          imageUrls: $checkedConvert('image_urls',
              (v) => (v as List<dynamic>?)?.map((e) => e as String).toList()),
        );
        return val;
      },
      fieldKeyMap: const {
        'activityId': 'activity_id',
        'createdAt': 'created_at',
        'updatedAt': 'updated_at',
        'userId': 'user_id',
        'imageUrls': 'image_urls'
      },
    );

Map<String, dynamic> _$$ActivityImplToJson(_$ActivityImpl instance) =>
    <String, dynamic>{
      'activity_id': instance.activityId,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'user_id': instance.userId,
      'title': instance.title,
      'description': instance.description,
      'image_urls': instance.imageUrls,
    };

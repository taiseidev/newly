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
            'image_urls',
            'created_at',
            'updated_at'
          ],
        );
        final val = _$ActivityImpl(
          activityId: $checkedConvert('activity_id', (v) => v as String),
          userId: $checkedConvert('user_id', (v) => v as String?),
          title: $checkedConvert('title', (v) => v as String?),
          description: $checkedConvert('description', (v) => v as String?),
          imageUrls: $checkedConvert('image_urls',
              (v) => (v as List<dynamic>?)?.map((e) => e as String).toList()),
          createdAt: $checkedConvert('created_at',
              (v) => v == null ? null : DateTime.parse(v as String)),
          updatedAt: $checkedConvert('updated_at',
              (v) => v == null ? null : DateTime.parse(v as String)),
        );
        return val;
      },
      fieldKeyMap: const {
        'activityId': 'activity_id',
        'userId': 'user_id',
        'imageUrls': 'image_urls',
        'createdAt': 'created_at',
        'updatedAt': 'updated_at'
      },
    );

Map<String, dynamic> _$$ActivityImplToJson(_$ActivityImpl instance) =>
    <String, dynamic>{
      'activity_id': instance.activityId,
      'user_id': instance.userId,
      'title': instance.title,
      'description': instance.description,
      'image_urls': instance.imageUrls,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

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
            'date',
            'title',
            'description',
            'mood',
            'image_url'
          ],
        );
        final val = _$ActivityImpl(
          activityId: $checkedConvert('activity_id', (v) => v as int?),
          userId: $checkedConvert('user_id', (v) => v as int?),
          date: $checkedConvert('date', (v) => v as String?),
          title: $checkedConvert('title', (v) => v as String?),
          description: $checkedConvert('description', (v) => v as String?),
          mood: $checkedConvert('mood', (v) => v as String?),
          imageUrl: $checkedConvert('image_url', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'activityId': 'activity_id',
        'userId': 'user_id',
        'imageUrl': 'image_url'
      },
    );

Map<String, dynamic> _$$ActivityImplToJson(_$ActivityImpl instance) =>
    <String, dynamic>{
      'activity_id': instance.activityId,
      'user_id': instance.userId,
      'date': instance.date,
      'title': instance.title,
      'description': instance.description,
      'mood': instance.mood,
      'image_url': instance.imageUrl,
    };
